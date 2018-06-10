;; Copyright (C) 2005--2017 Taylor R. Campbell

;; Author: Taylor R. Campbell <campbell+paredit@mumble.net>
 3;; Version: 25beta
;; Package-Version: 20171126.1805
;; Created: 2005-07-31
;; Keywords: lisp

;; NOTE:  THIS IS A BETA VERSION OF PAREDIT.  USE AT YOUR OWN RISK.
;; THIS FILE IS SUBJECT TO CHANGE, AND NOT SUITABLE FOR DISTRIBUTION
;; BY PACKAGE MANAGERS SUCH AS APT, PKGSRC, MACPORTS, &C.

;; Paredit is free software: you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; Paredit is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with paredit.  If not, see <http://www.gnu.org/licenses/>.

;;; The currently released version of paredit is available at
;;;   <https://mumble.net/~campbell/emacs/paredit.el>.
;;;
;;; The latest beta version of paredit is available at
;;;   <https://mumble.net/~campbell/emacs/paredit-beta.el>.
;;;
;;; The Git repository for paredit is available at
;;;   <https://mumble.net/~campbell/git/paredit.git>
;;;
;;; Release notes are available at
;;;   <https://mumble.net/~campbell/emacs/paredit.release>.

;;; Install paredit by placing `paredit.el' in `/path/to/elisp', a
;;; directory of your choice, and adding to your .emacs file:
;;;
;;;   (add-to-list 'load-path "/path/to/elisp")
;;;   (autoload 'enable-paredit-mode "paredit"
;;;     "Turn on pseudo-structural editing of Lisp code."
;;;     t)
;;;
;;; Start Paredit Mode on the fly with `M-x enable-paredit-mode RET',
;;; or always enable it in a major mode `M' (e.g., `lisp') with:
;;;
;;;   (add-hook 'M-mode-hook 'enable-paredit-mode)
;;;
;;; Customize paredit using `eval-after-load':
;;;
;;;   (eval-after-load 'paredit
;;;     '(progn
;;;        (define-key paredit-mode-map (kbd "ESC M-A-C-s-)")
;;;          'paredit-dwim)))
;;;
;;; Send questions, bug reports, comments, feature suggestions, &c.,
;;; via email to the author's surname at mumble.net.
;;;
;;; Paredit should run in GNU Emacs 21 or later and XEmacs 21.5.28 or
;;; later.

;;; The paredit minor mode, Paredit Mode, binds common character keys,
;;; such as `(', `)', `"', and `\', to commands that carefully insert
;;; S-expression structures in the buffer:
;;;
;;;   ( inserts `()', leaving the point in the middle;
;;;   ) moves the point over the next closing delimiter;
;;;   " inserts `""' if outside a string, or inserts an escaped
;;;      double-quote if in the middle of a string, or moves over the
;;;      closing double-quote if at the end of a string; and
;;;   \ prompts for the character to escape, to avoid inserting lone
;;;      backslashes that may break structure.
;;;
;;; In comments, these keys insert themselves.  If necessary, you can
;;; insert these characters literally outside comments by pressing
;;; `C-q' before these keys, in case a mistake has broken the
;;; structure.
;;;
;;; These key bindings are designed so that when typing new code in
;;; Paredit Mode, you can generally type exactly the same sequence of
;;; keys you would have typed without Paredit Mode.
;;;
;;; Paredit Mode also binds common editing keys, such as `DEL', `C-d',
;;; and `C-k', to commands that respect S-expression structures in the
;;; buffer:
;;;
;;;   DEL deletes the previous character, unless it is a delimiter: DEL
;;;        will move the point backward over a closing delimiter, and
;;;        will delete a delimiter pair together if between an open and
;;;        closing delimiter;
;;;
;;;   C-d deletes the next character in much the same manner; and
;;;
;;;   C-k kills all S-expressions that begin anywhere between the point
;;;        and the end of the line or the closing delimiter of the
;;;        enclosing list, whichever is first.
;;;
;;; If necessary, you can delete a character, kill a line, &c.,
;;; irrespective of S-expression structure, by pressing `C-u' before
;;; these keys, in case a mistake has broken the structure.
;;;
;;; Finally, Paredit Mode binds some keys to complex S-expression
;;; editing operations.  For example, `C-<right>' makes the enclosing
;;; list slurp up an S-expression to its right (here `|' denotes the
;;; point):
;;;
;;;   (foo (bar | baz) quux)  C-<right>  (foo (bar | baz quux))
;;;
;;; Some paredit commands automatically reindent code.  When they do,
;;; they try to indent as locally as possible, to avoid interfering
;;; with any indentation you might have manually written.  Only the
;;; advanced S-expression manipulation commands automatically reindent,
;;; and only the forms that they immediately operated upon (and their
;;; subforms).
;;;
;;; This code is written for clarity, not efficiency.  It frequently
;;; walks over S-expressions redundantly.  If you have problems with
;;; the time it takes to execute some of the commands, let me know.

;;; This assumes Unix-style LF line endings.

(defun paredit-backward-barf-sexp (&optional argument)
  "Remove the first S-expression in the current list from that list
  by moving the closing delimiter.
Automatically reindent the barfed S-expression and the form from which
  it was barfed."
  (interactive "P")
  (paredit-lose-if-not-in-sexp 'paredit-backward-barf-sexp)
  (if (and (numberp argument) (< argument 0))
      (paredit-backward-slurp-sexp (- 0 argument))
    (let ((end (make-marker)))
      (set-marker end (point))
      (save-excursion
        (backward-up-list)
        (let ((open (char-after)))
          (delete-char +1)
          (paredit-ignore-sexp-errors
            (paredit-forward-and-indent
             (if (or (not argument) (numberp argument))
                 argument
                 (let ((n 0))
                   (save-excursion
                     (while (paredit-handle-sexp-errors
                                (save-excursion
                                  (forward-sexp)
                                  (<= (point) end))
                              nil)
                       (forward-sexp)
                       (setq n (+ n 1))))
                   n))))
          (while (progn (paredit-skip-whitespace t) (eq (char-after) ?\; ))
            (forward-line 1))
          (if (eobp)
              ;++ We'll have deleted the close, but there's no open.
              ;++ Is that OK?
              (error "Barfing all subexpressions with no close-paren?"))
          ;** Don't use `insert' here.  Consider, e.g., barfing from
          ;**   (foo|)
          ;** and how `save-excursion' works.
          (insert-before-markers open))
        (backward-up-list)
        (lisp-indent-line)
        (indent-sexp)))))

(defun paredit-forward-and-indent (&optional n)
  "Move forward by N S-expressions, indenting them with `indent-region'."
  (let ((start (point)))
    (forward-sexp n)
    (indent-region start (point) nil)))

(defun paredit-backward-slurp-sexp (&optional argument)
  "Add the S-expression preceding the current list into that list
  by moving the closing delimiter.
Automatically reindent the whole form into which new S-expression was
  slurped.
If in a string, move the opening double-quote backward by one
  S-expression and escape any intervening characters as necessary,
  without altering any indentation or formatting."
  (interactive "P")
  (save-excursion
    (cond ((paredit-in-comment-p)
           (error "Invalid context for slurping S-expressions."))
          ((numberp argument)
           (if (< argument 0)
               (paredit-backward-barf-sexp (- 0 argument))
               (while (< 0 argument)
                 (paredit-backward-slurp-sexp)
                 (setq argument (- argument 1)))))
          ((paredit-in-string-p)
           ;; If there is anything to slurp into the string, take that.
           ;; Otherwise, try to slurp into the enclosing list.
           (if (save-excursion
                 (goto-char (paredit-enclosing-string-start))
                 (paredit-handle-sexp-errors (progn (backward-sexp) nil)
                   t))
               (progn
                 (goto-char (paredit-enclosing-string-start))
                 (paredit-backward-slurp-into-list argument))
               (paredit-backward-slurp-into-string argument)))
          (t
           (paredit-backward-slurp-into-list argument)))))

(defun paredit-backward-slurp-into-list (&optional argument)
  (let ((nestedp nil))
    (save-excursion
      (backward-up-list)
      (let ((open (char-after)))
        (delete-char +1)
        (catch 'return
          (while t
            (paredit-handle-sexp-errors
                (progn (backward-sexp)
                       (if argument
                           (paredit-ignore-sexp-errors
                             (while (not (bobp))
                               (backward-sexp))))
                       (throw 'return nil))
              (setq nestedp t)
              (backward-up-list)
              (setq open
                    (prog1 (char-after)
                      (save-excursion (insert open) (delete-char +1)))))))
        (insert open))
      ;; Reindent the line at the beginning of wherever we inserted the
      ;; opening delimiter, and then indent the whole S-expression.
      (backward-up-list)
      (lisp-indent-line)
      (indent-sexp))
    ;; If we slurped into an empty list, don't leave dangling space:
    ;; (foo |).
    (if (and (not nestedp)
             (eq (save-excursion (paredit-skip-whitespace nil) (point))
                 (save-excursion (backward-sexp) (forward-sexp) (point)))
             (eq (save-excursion (up-list) (backward-char) (point))
                 (save-excursion (paredit-skip-whitespace t) (point))))
        (delete-region (save-excursion (paredit-skip-whitespace nil) (point))
                       (save-excursion (paredit-skip-whitespace t) (point))))))

(defun paredit-enclosing-string-start ()
  (car (paredit-string-start+end-points)))

(defun paredit-forward-for-quote (end)
  (let ((state (paredit-current-parse-state)))
    (while (< (point) end)
      (let ((new-state (parse-partial-sexp (point) (1+ (point))
                                           nil nil state)))
        (if (paredit-in-string-p new-state)
            (if (not (paredit-in-string-escape-p))
                (setq state new-state)
              ;; Escape character: turn it into an escaped escape
              ;; character by appending another backslash.
              (insert ?\\ )
              ;; Now the point is after both escapes, and we want to
              ;; rescan from before the first one to after the second
              ;; one.
              (setq state
                    (parse-partial-sexp (- (point) 2) (point)
                                        nil nil state))
              ;; Advance the end point, since we just inserted a new
              ;; character.
              (setq end (1+ end)))
          ;; String: escape by inserting a backslash before the quote.
          (backward-char)
          (insert ?\\ )
          ;; The point is now between the escape and the quote, and we
          ;; want to rescan from before the escape to after the quote.
          (setq state
                (parse-partial-sexp (1- (point)) (1+ (point))
                                    nil nil state))
          ;; Advance the end point for the same reason as above.
          (setq end (1+ end)))))))

(defun paredit-backward-slurp-into-string (&optional argument)
  (let ((start (paredit-enclosing-string-start))
        (end (paredit-enclosing-string-end)))
    (goto-char start)
    ;; Signal any errors that we might get first, before mucking with
    ;; the buffer's contents.
    (save-excursion (backward-sexp))
    (let ((open (char-after))
          (target (point)))
      ;; Skip intervening whitespace if we're slurping into an empty
      ;; string.  XXX What about nonempty strings?
      (if (and (= (+ start 2) end)
               (eq (save-excursion (paredit-skip-whitespace nil) (point))
                   (save-excursion (backward-sexp) (forward-sexp) (point))))
          (delete-region (save-excursion (paredit-skip-whitespace nil) (point))
                         (+ (point) 1))
          (delete-char +1))
      (backward-sexp)
      (if argument
          (paredit-ignore-sexp-errors
            (while (not (bobp))
              (backward-sexp))))
      (insert open)
      (paredit-forward-for-quote target))))

(defun paredit-forward-slurp-sexp (&optional argument)
  "Add the S-expression following the current list into that list
  by moving the closing delimiter.
Automatically reindent the newly slurped S-expression with respect to
  its new enclosing form.
If in a string, move the opening double-quote forward by one
  S-expression and escape any intervening characters as necessary,
  without altering any indentation or formatting."
  (interactive "P")
  (save-excursion
    (cond ((paredit-in-comment-p)
           (error "Invalid context for slurping S-expressions."))
          ((numberp argument)
           (if (< argument 0)
               (paredit-forward-barf-sexp (- 0 argument))
               (while (< 0 argument)
                 (paredit-forward-slurp-sexp)
                 (setq argument (- argument 1)))))
          ((paredit-in-string-p)
           ;; If there is anything to slurp into the string, take that.
           ;; Otherwise, try to slurp into the enclosing list.
           (if (save-excursion
                 (goto-char (paredit-enclosing-string-end))
                 (paredit-handle-sexp-errors (progn (forward-sexp) nil)
                   t))
               (progn
                 (goto-char (paredit-enclosing-string-end))
                 (paredit-forward-slurp-into-list argument))
               (paredit-forward-slurp-into-string argument)))
          (t
           (paredit-forward-slurp-into-list argument)))))

(defun paredit-enclosing-string-end ()
  (+ 1 (cdr (paredit-string-start+end-points))))

(defun paredit-string-start+end-points (&optional state)
  "Return a cons of the points of open and close quotes of the string.
The string is determined from the parse state STATE, or the parse state
  from the beginning of the defun to the point.
This assumes that `paredit-in-string-p' has already returned true, i.e.
  that the point is already within a string."
  (save-excursion
    ;; 8. character address of start of comment or string; nil if not
    ;;    in one
    (let ((start (nth 8 (or state (paredit-current-parse-state)))))
      (goto-char start)
      (forward-sexp 1)
      (cons start (1- (point))))))

(defun paredit-in-string-p (&optional state)
  "True if the parse state is within a double-quote-delimited string.
If no parse state is supplied, compute one from the beginning of the
  defun to the point."
  ;; 3. non-nil if inside a string (the terminator character, really)
  (and (nth 3 (or state (paredit-current-parse-state)))
       t))

(defun paredit-in-comment-p (&optional state)
  "True if parse state STATE is within a comment.
If no parse state is supplied, compute one from the beginning of the
  defun to the point."
  ;; 4. nil if outside a comment, t if inside a non-nestable comment,
  ;;    else an integer (the current comment nesting)
  (and (nth 4 (or state (paredit-current-parse-state)))
       t))

(defun paredit-lose-if-not-in-sexp (command)
  (if (or (paredit-in-string-p)
          (paredit-in-comment-p)
          (paredit-in-char-p))
      (error "Invalid context for command `%s'." command)))

(defun paredit-in-char-p (&optional position)
  "True if point is on a character escape outside a string."
  (save-excursion
    (goto-char (or position (point)))
    (paredit-in-string-escape-p)))

(defun paredit-in-string-escape-p ()
  "True if the point is on a character escape of a string.
This is true only if the character is preceded by an odd number of
  backslashes.
This assumes that `paredit-in-string-p' has already returned true."
  (let ((oddp nil))
    (save-excursion
      (while (eq (char-before) ?\\ )
        (setq oddp (not oddp))
        (backward-char)))
    oddp))

(defun paredit-current-parse-state ()
  "Return parse state of point from beginning of defun."
  (let ((point (point)))
    (beginning-of-defun)
    ;; Calling PARSE-PARTIAL-SEXP will advance the point to its second
    ;; argument (unless parsing stops due to an error, but we assume it
    ;; won't in paredit-mode).
    (parse-partial-sexp (point) point)))

(defun paredit-forward-slurp-into-list (&optional argument)
(interactive)
  (let ((nestedp nil))
    (save-excursion
      (up-list)                            ; Up to the end of the list to
      (let ((close (char-before)))         ;   save and delete the closing
        (delete-char -1)                   ;   delimiter.
        (let ((start (point)))
          (catch 'return                   ; Go to the end of the desired
            (while t                       ;   S-expression, going up a
              (paredit-handle-sexp-errors  ;   list if it's not in this,
                  (progn (forward-sexp)
                         (if argument
                             (paredit-ignore-sexp-errors
                               (while (not (eobp))
                                 (forward-sexp))))
                         (throw 'return nil))
                (setq nestedp t)
                (up-list)
                (setq close                ; adjusting for mixed
                      (prog1 (char-before) ;   delimiters as necessary,
                        (delete-char -1)
                        (insert close))))))
          (insert close)                   ;  to insert that delimiter.
          (indent-region start (point) nil))))
    (if (and (not nestedp)
             (eq (save-excursion (paredit-skip-whitespace nil) (point))
                 (save-excursion (backward-up-list) (forward-char) (point)))
             (eq (save-excursion (forward-sexp) (backward-sexp) (point))
                 (save-excursion (paredit-skip-whitespace t) (point))))
        (delete-region (save-excursion (paredit-skip-whitespace nil) (point))
                       (save-excursion (paredit-skip-whitespace t) (wpoint))))))

(defun paredit-forward-slurp-into-string (&optional argument)
  (let ((start (paredit-enclosing-string-start))
        (end (paredit-enclosing-string-end)))
    (goto-char end)
    ;; Signal any errors that we might get first, before mucking with
    ;; the buffer's contents.
    (save-excursion (forward-sexp))
    (let ((close (char-before)))
      ;; Skip intervening whitespace if we're slurping into an empty
      ;; string.  XXX What about nonempty strings?
      (if (and (= (+ start 2) end)
               (eq (save-excursion (paredit-skip-whitespace t) (point))
                   (save-excursion (forward-sexp) (backward-sexp) (point))))
          (delete-region (- (point) 1)
                         (save-excursion (paredit-skip-whitespace t) (point)))
          (delete-char -1))
      (paredit-forward-for-quote
       (save-excursion
         (forward-sexp)
         (if argument
             (while (paredit-handle-sexp-errors (progn (forward-sexp) t) nil)))
         (point)))
      (insert close))))

(defun paredit-forward-barf-sexp (&optional argument)
  "Remove the last S-expression in the current list from that list
  by moving the closing delimiter.
Automatically reindent the newly barfed S-expression with respect to
  its new enclosing form."
  (interactive "P")
  (paredit-lose-if-not-in-sexp 'paredit-forward-barf-sexp)
  (if (and (numberp argument) (< argument 0))
      (paredit-forward-slurp-sexp (- 0 argument))
    (let ((start (point)) (end nil))
      (save-excursion
        (up-list)                       ; Up to the end of the list to
        (let ((close (char-before)))    ;   save and delete the closing
          (delete-char -1)              ;   delimiter.
          (setq end (point))
          (paredit-ignore-sexp-errors   ; Go back to where we want to
            (if (or (not argument)      ;   insert the delimiter.
                    (numberp argument))
                (backward-sexp argument)
                (while (paredit-handle-sexp-errors
                           (save-excursion (backward-sexp) (<= start (point)))
                         nil)
                  (backward-sexp))))
          (paredit-skip-whitespace nil) ; Skip leading whitespace.
          (cond ((bobp)
                 ;++ We'll have deleted the close, but there's no open.
                 ;++ Is that OK?
                 (error "Barfing all subexpressions with no open-paren?"))
                ((paredit-in-comment-p) ; Don't put the close-paren in
                 (newline)))            ;   a comment.
          (insert close))
        ;; Reindent all of the newly barfed S-expressions.  Start at the
        ;; start of the first barfed S-expression, not at the close we
        ;; just inserted.
        (forward-sexp)
        (backward-sexp)
        (if (or (not argument) (numberp argument))
            (paredit-forward-and-indent argument)
            (indent-region (point) end))))))

(defun paredit-skip-whitespace (trailing-p &optional limit)
  "Skip past any whitespace, or until the point LIMIT is reached.
If TRAILING-P is nil, skip leading whitespace; otherwise, skip trailing
  whitespace."
  (funcall (if trailing-p 'skip-chars-forward 'skip-chars-backward)
           " \t\n"  ; This should skip using the syntax table, but LF
           limit))    ; is a comment end, not newline, in Lisp mode.

(defmacro paredit-ignore-sexp-errors (&rest body)
  `(paredit-handle-sexp-errors (progn ,@body)
                               nil))

(defmacro paredit-handle-sexp-errors (body &rest handler)
  `(condition-case ()
       ,body
     (,paredit-sexp-error-type ,@handler)))

(defvar paredit-sexp-error-type
  (with-temp-buffer
    (insert "(")
    (condition-case condition
        (backward-sexp)
      (error (if (eq (car condition) 'error)
                 (paredit-warn "%s%s%s%s%s"
                               "Paredit is unable to discriminate"
                               " S-expression parse errors from"
                               " other errors. "
                               " This may cause obscure problems. "
                               " Please upgrade Emacs."))
             (car condition)))))

(defalias 'paredit-warn (if (fboundp 'warn) 'warn 'message))

(defun paredit-enclosing-list-start ()
  (save-excursion
    (backward-up-list)
    (point)))

(defun paredit-enclosing-list-end ()
  (save-excursion
    (up-list)
    (point)))

(defmacro paredit-preserving-column (&rest body)
  "Evaluate BODY and restore point to former column, relative to code.
Assumes BODY will change only indentation.
If point was on code, it moves with the code.
If point was on indentation, it stays in indentation."
  (let ((column (make-symbol "column"))
        (indentation (make-symbol "indentation")))
    `(let ((,column (current-column))
           (,indentation (paredit-current-indentation)))
       (let ((value (progn ,@body)))
         (paredit-restore-column ,column ,indentation)
         value))))

(defun paredit-restore-column (column indentation)
  ;; Preserve the point's position either in the indentation or in the
  ;; code: if on code, move with the code; if in indentation, leave it
  ;; in the indentation, either where it was (if still on indentation)
  ;; or at the end of the indentation (if the code moved far enough
  ;; left).
  (let ((indentation* (paredit-current-indentation)))
    (goto-char
     (+ (point-at-bol)
        (cond ((not (< column indentation))
               (+ column (- indentation* indentation)))
              ((<= indentation* column) indentation*)
              (t column))))))

(defun paredit-current-indentation ()
  (save-excursion
    (back-to-indentation)
    (current-column)))

  ; ------

(defun paredit-wrap-sexp (&optional argument open close)
  "Wrap the following S-expression.
If a `C-u' prefix argument is given, wrap all S-expressions following
  the point until the end of the buffer or of the enclosing list.
If a numeric prefix argument N is given, wrap N S-expressions.
Automatically indent the newly wrapped S-expression.
As a special case, if the point is at the end of a list, simply insert
  a parenthesis pair, rather than inserting a lone opening delimiter
  and then signalling an error, in the interest of preserving
  structure.
By default OPEN and CLOSE are round delimiters."
  (interactive "P")
  (paredit-lose-if-not-in-sexp 'paredit-wrap-sexp)
  (let ((open (or open ?\( ))
        (close (or close ?\) )))
    (paredit-handle-sexp-errors
        ((lambda (n) (paredit-insert-pair n open close 'goto-char))
         (cond ((integerp argument) argument)
               ((consp argument) (paredit-count-sexps-forward))
               ((paredit-region-active-p) nil)
               (t 1)))
      (insert close)
      (backward-char)))
  (save-excursion (backward-up-list) (indent-sexp)))

(defvar paredit-space-for-delimiter-predicates nil
  "List of predicates for whether to put space by delimiter at point.
Each predicate is a function that is is applied to two arguments, ENDP
  and DELIMITER, and that returns a boolean saying whether to put a
  space next to the delimiter -- before/after the delimiter if ENDP is
  false/true, respectively.
If any predicate returns false, no space is inserted: every predicate
  has veto power.
Each predicate may assume that the point is not at the beginning/end of
  the buffer, and that the point is preceded/followed by a word
  constituent, symbol constituent, string quote, or delimiter matching
  DELIMITER, if ENDP is false/true, respectively.
Each predicate should examine only text before/after the point if ENDP is
  false/true, respectively.")

(defun paredit-space-for-delimiter-p (endp delimiter)
  ;; If at the buffer limit, don't insert a space.  If there is a word,
  ;; symbol, other quote, or non-matching parenthesis delimiter (i.e. a
  ;; close when want an open the string or an open when we want to
  ;; close the string), do insert a space.
  (and (not (if endp (eobp) (bobp)))
       (memq (char-syntax (if endp (char-after) (char-before)))
             (list ?w ?_ ?\"
                   (let ((matching (matching-paren delimiter)))
                     (and matching (char-syntax matching)))
                   (and (not endp)
                        (eq ?\" (char-syntax delimiter))
                        ?\) )))
       (catch 'exit
         (dolist (predicate paredit-space-for-delimiter-predicates)
           (if (not (funcall predicate endp delimiter))
               (throw 'exit nil)))
         t)))
