(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(load "~/.emacs.d/pack")

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

; syntax highlighting
(global-font-lock-mode 1)
(show-paren-mode 1)

; paskat vittuun
(blink-cursor-mode 0)
(setq column-number-mode t)
(setq history-length 500)
(setq visible-cursor nil)
(setq ring-bell-function 'ignore)
(setq visible-bell nil)
(setq inhibit-startup-screen t)
; wrapping pois
(set-default 'truncate-lines t)
(setq-default show-trailing-whitespace t)
(setq mark-even-if-inactive nil)
(setq bookmark-save-flag 1)
(setq scroll-error-top-bottom t)
(delete-selection-mode)

; rivinumerot
(global-linum-mode 1)

(setq linum-format
      (lambda (line)
        (propertize
          (format
            (let ((w (length (number-to-string (count-lines (point-min)
                                                            (point-max))))))
              (concat "%" (number-to-string w) "d ")) line) 'face
          'linum)))

(setq split-height-threshold nil)
(setq split-width-threshold 0)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq x-select-enable-clipboard t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)
(setq inhibit-splash-screen t)
(setq echo-keystrokes 0.01)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq auto-save-default t)
(setq ring-bell-function 'ignore)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)
(setq set-mark-command-repeat-pop t)
(setq read-quoted-char-radix 16)
(setq select-enable-clipboard nil)
(setq select-enable-primary t)
(setq mouse-drag-copy-region t)
(setq select-active-regions nil)
(setq register-preview-delay 0)
(setq size-indication-mode 1)
(setq search-upper-case t)
(setq delete-by-moving-to-trash t)
(setq trash-directory "~/.del/")

(set-default-font "-*-terminus-medium-*-*-*-20-*-*-*-*-*-*-*")

(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(setq savehist-file (concat user-emacs-directory "savehist/savehist"))

(setq backup-directory-alist
  `((".*" . ,(concat user-emacs-directory "backups/"))))
(setq auto-save-file-name-transforms
  `((".*" ,(concat user-emacs-directory "auto-saves/") t)))
(setq auto-save-list-file-prefix
  (concat user-emacs-directory "auto-saves/.saves-"))'

(defadvice delete-window (after restore-balance activate)
  (balance-windows))

(defadvice select-window (after restore-balance-select activate)
  (balance-windows))


; (add-hook 'text-mode-hook 'evil-local-mode)
; (add-hook 'prog-mode-hook 'evil-local-mode)
; (add-hook 'undo-tree-mode-hook 'evil-local-mode)

(setq require-final-newline t)
(global-set-key (kbd "C-x C-b") #'ibuffer)

; (define-key minibuffer-local-map (kbd "C-p") 'previous-history-element)
; (define-key minibuffer-local-map (kbd "C-n") 'next-history-element)

; for vim users
(defalias 'vs 'split-window-horizontally)
(defalias 'clo 'delete-window)

; ; evil
; (defun evil-local-mode-fixed-escape ()
;   "Turn on Evil in the current buffer AND `evil-esc-mode'. This makes C-[ work
;    like <escape> when using `evil-local-mode'."
;   (interactive)
;   (progn
;     (turn-on-evil-mode)
;     (evil-esc-mode 1)))
; 
; (defun evil-local-mode-fixed-escape-toggle ()
;   "Toggle Evil on/off in the current buffer AND `evil-esc-mode'. This makes C-[
;    work like <escape> when using `evil-local-mode'."
;   (interactive)
;   (if evil-local-mode
;     (progn
;       (message "evil-mode off")
;       (turn-off-evil-mode)
;       (evil-esc-mode 0))
;     (progn
;       (turn-on-evil-mode)
;       (evil-esc-mode 1))))
; 
; ; (setq evil-insert-state-message nil)
; 
; (define-key evil-insert-state-map (kbd "C-a") 'confirm-quit)
; (define-key evil-normal-state-map (kbd "C-a") 'confirm-quit)
; 
; (define-key evil-insert-state-map (kbd "<ESC>") 'evil-normal-state)
; (define-key evil-insert-state-map (kbd "<DEL>") 'backward-delete-char-untabify)
; 
; (define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
; (define-key evil-normal-state-map (kbd "<DEL>") 'windmove-left)
; 
; (define-key evil-normal-state-map (kbd "Q") (kbd "@@"))
; 
; (define-key evil-normal-state-map (kbd "C-]") 'my-jump-to-tag)
; 
; (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
; (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)


; (define-key evil-insert-state-map (kbd "C-u")
;   (lambda ()
;     (interactive)
;     (evil-delete (point-at-bol) (point))))

; (evil-define-key 'normal slime-repl-mode-map (kbd "j")
            ; 'slime-repl-forward-input)
; (evil-define-key 'normal slime-repl-mode-map (kbd "k")
;             'slime-repl-backward-input)
; (evil-define-key 'normal slime-repl-mode-map (kbd "RET")
;             'slime-repl-return)

(setq inferior-lisp-program "sbcl")

(setq slime-contribs '(slime-fancy))
(add-to-list 'slime-contribs 'slime-trace-dialog)
(slime-setup '(slime-repl))

(setq avy-background t)
(setq undo-tree-auto-save-history t)
(setq lazy-highlight-initial-delay 0)
(setq tab-always-indent 'complete)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq isearch-resume-in-command-history t)
(setq shift-select-mode nil)
(setq electric-indent-mode t)
(setq search-default-mode t)
(setq replace-char-fold t)
(setq view-read-only t)
(setq load-prefer-newer t)

; X11 keybindings
(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)
(define-key minibuffer-local-map (kbd "C-u") 'kill-whole-line)

(electric-pair-mode 1)

(global-set-key (kbd "<DEL>") 'xah-delete-backward-char-or-bracket-text)
(global-set-key (kbd "<backspace>") 'xah-delete-backward-char-or-bracket-text)
(global-set-key (kbd "M-,") 'xah-backward-left-bracket)
(global-set-key (kbd "M-.") 'xah-forward-right-bracket)
(global-set-key (kbd "M-h") 'xah-select-block)
(global-set-key (kbd "M-\\") 'xah-select-line)
(global-set-key (kbd "M-i") 'xah-select-text-in-quote)
(global-set-key (kbd "M-p") 'xah-extend-selection)
(global-set-key (kbd "<M-tab>") 'xah-goto-matching-bracket)
(global-set-key (kbd "C-[ TAB") 'xah-goto-matching-bracket)

(defun xah-extend-selection ()
  "Select the current word, bracket/quote expression, or expand selection.
Subsequent calls expands the selection.

when no selection,
• if cursor is on a bracket, select whole bracketed thing including bracket
• if cursor is on a quote, select whole quoted thing including quoted
• if cursor is on the beginning of line, select the line.
• else, select current word.

when there's a selection, the selection extension behavior is still experimental.
Roughly:
• if 1 line is selected, extend to next line.
• if multiple lines is selected, extend to next line.
• if a bracketed text is selected, extend to include the outer bracket. If there's no outer, select current line.

 to line, or bracket/quoted text,
or text block, whichever is the smallest.

URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
Version 2017-01-15"
  (interactive)
  (if (region-active-p)
      (progn
        (let (($rb (region-beginning)) ($re (region-end)))
          (goto-char $rb)
          (cond
           ((looking-at "\\s(")
            (if (eq (nth 0 (syntax-ppss)) 0)
                (progn
                  (message "left bracket, depth 0.")
                  (end-of-line) ; select current line
                  (set-mark (line-beginning-position)))
              (progn
                (message "left bracket, depth not 0")
                (up-list -1 t t)
                (mark-sexp))))
           ((eq $rb (line-beginning-position))
            (progn
              (goto-char $rb)
              (let (($firstLineEndPos (line-end-position)))
                (cond
                 ((eq $re $firstLineEndPos)
                  (progn
                    (message "exactly 1 line. extend to next whole line." )
                    (forward-line 1)
                    (end-of-line)))
                 ((< $re $firstLineEndPos)
                  (progn
                    (message "less than 1 line. complete the line." )
                    (end-of-line)))
                 ((> $re $firstLineEndPos)
                  (progn
                    (message "beginning of line, but end is greater than 1st end of line" )
                    (goto-char $re)
                    (if (eq (point) (line-end-position))
                        (progn
                          (message "exactly multiple lines" )
                          (forward-line 1)
                          (end-of-line))
                      (progn
                        (message "multiple lines but end is not eol. make it so" )
                        (goto-char $re)
                        (end-of-line)))))
                 (t (error "logic error 42946" ))))))
           ((and (> (point) (line-beginning-position)) (<= (point) (line-end-position)))
            (progn
              (message "less than 1 line" )
              (end-of-line) ; select current line
              (set-mark (line-beginning-position))))
           (t (message "last resort" ) nil))))
    (progn
      (cond
       ((looking-at "\\s(")
        (message "left bracket")
        (mark-sexp)) ; left bracket
       ((looking-at "\\s)")
        (message "right bracket")
        (backward-up-list) (mark-sexp))
       ((looking-at "\\s\"")
        (message "string quote")
        (mark-sexp)) ; string quote
       ((and (eq (point) (line-beginning-position)) (not (looking-at "\n")))
        (message "beginning of line and not empty")
        (end-of-line)
        (set-mark (line-beginning-position)))
       ((or (looking-back "\\s_" 1) (looking-back "\\sw" 1))
        (message "left is word or symbol")
        (skip-syntax-backward "_w" )
        ;; (re-search-backward "^\\(\\sw\\|\\s_\\)" nil t)
        (mark-sexp))
       ((and (looking-at "\\s ") (looking-back "\\s " 1))
        (message "left and right both space" )
        (skip-chars-backward "\\s " ) (set-mark (point))
        (skip-chars-forward "\\s "))
       ((and (looking-at "\n") (looking-back "\n" 1))
        (message "left and right both newline")
        (skip-chars-forward "\n")
        (set-mark (point))
        (re-search-forward "\n[ \t]*\n")) ; between blank lines, select next text block
       (t (message "just mark sexp" )
          (mark-sexp))
       ;;
       ))))

(defvar xah-brackets nil "string of left/right brackets pairs.")
(setq xah-brackets "()[]{}<>（）［］｛｝⦅⦆〚〛⦃⦄“”‘’‹›«»「」〈〉《》【】〔〕⦗⦘『』〖〗〘〙｢｣⟦⟧⟨⟩⟪⟫⟮⟯⟬⟭⌈⌉⌊⌋⦇⦈⦉⦊❛❜❝❞❨❩❪❫❴❵❬❭❮❯❰❱❲❳〈〉⦑⦒⧼⧽﹙﹚﹛﹜﹝﹞⁽⁾₍₎⦋⦌⦍⦎⦏⦐⁅⁆⸢⸣⸤⸥⟅⟆⦓⦔⦕⦖⸦⸧⸨⸩｟｠⧘⧙⧚⧛⸜⸝⸌⸍⸂⸃⸄⸅⸉⸊᚛᚜༺༻༼༽⏜⏝⎴⎵⏞⏟⏠⏡﹁﹂﹃﹄︹︺︻︼︗︘︿﹀︽︾﹇﹈︷︸")

(defvar xah-left-brackets '("(" "{" "[" "<" "〔" "【" "〖" "〈" "《" "「" "『" "“" "‘" "‹" "«" )
  "List of left bracket chars.")
(progn
;; make xah-left-brackets based on xah-brackets
  (setq xah-left-brackets '())
  (dotimes ($x (- (length xah-brackets) 1))
    (when (= (% $x 2) 0)
      (push (char-to-string (elt xah-brackets $x))
            xah-left-brackets)))
  (setq xah-left-brackets (reverse xah-left-brackets)))

(defvar xah-right-brackets '(")" "]" "}" ">" "〕" "】" "〗" "〉" "》" "」" "』" "”" "’" "›" "»")
  "list of right bracket chars.")
(progn
  (setq xah-right-brackets '())
  (dotimes ($x (- (length xah-brackets) 1))
    (when (= (% $x 2) 1)
      (push (char-to-string (elt xah-brackets $x))
            xah-right-brackets)))
  (setq xah-right-brackets (reverse xah-right-brackets)))

(defun xah-backward-left-bracket ()
  "Move cursor to the previous occurrence of left bracket.
The list of brackets to jump to is defined by `xah-left-brackets'.
URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
Version 2015-10-01"
  (interactive)
  (re-search-backward (regexp-opt xah-left-brackets) nil t))

(defun xah-forward-right-bracket ()
  "Move cursor to the next occurrence of right bracket.
The list of brackets to jump to is defined by `xah-right-brackets'.
URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
Version 2015-10-01"
  (interactive)
  (re-search-forward (regexp-opt xah-right-brackets) nil t))

(defun xah-delete-backward-char-or-bracket-text ()
  "Delete backward 1 character, but if it's a \"quote\" or bracket ()[]{}【】「」 etc, delete bracket and the inner text, push the deleted text to `kill-ring'.

What char is considered bracket or quote is determined by current syntax table.

If `universal-argument' is called first, do not delete inner text.

URL `http://ergoemacs.org/emacs/emacs_delete_backward_char_or_bracket_text.html'
Version 2017-07-02"
  (interactive)
  (if (and delete-selection-mode (region-active-p))
      (delete-region (region-beginning) (region-end))
    (cond
     ((looking-back "\\s)" 1)
      (if current-prefix-arg
          (_xah-delete-backward-bracket-pair)
        (_xah-delete-backward-bracket-text)))
     ((looking-back "\\s(" 1)
      (progn
        (backward-char)
        (forward-sexp)
        (if current-prefix-arg
            (_xah-delete-backward-bracket-pair)
          (_xah-delete-backward-bracket-text))))
     ((looking-back "\\s\"" 1)
      (if (nth 3 (syntax-ppss))
          (progn
            (backward-char )
            (_xah-delete-forward-bracket-pairs (not current-prefix-arg)))
        (if current-prefix-arg
            (_xah-delete-backward-bracket-pair)
          (_xah-delete-backward-bracket-text))))
     (t
      (delete-char -1)))))

(defun _xah-delete-backward-bracket-text ()
  "Delete the matching brackets/quotes to the left of cursor, incvluding the inner text.

This command assumes the left of point is a right bracket, and there's a matching one before it.

What char is considered bracket or quote is determined by current syntax table.

URL `http://ergoemacs.org/emacs/emacs_delete_backward_char_or_bracket_text.html'
Version 2017-07-02"
  (interactive)
  (progn
    (forward-sexp -1)
    (mark-sexp)
    (kill-region (region-beginning) (region-end))))

(defun _xah-delete-backward-bracket-pair ()
  "Delete the matching brackets/quotes to the left of cursor.

After the command, mark is set at the left matching bracket position, so you can `exchange-point-and-mark' to select it.

This command assumes the left of point is a right bracket, and there's a matching one before it.

What char is considered bracket or quote is determined by current syntax table.

URL `http://ergoemacs.org/emacs/emacs_delete_backward_char_or_bracket_text.html'
Version 2017-07-02"
  (interactive)
  (let (( $p0 (point)) $p1)
    (forward-sexp -1)
    (setq $p1 (point))
    (goto-char $p0)
    (delete-char -1)
    (goto-char $p1)
    (delete-char 1)
    (push-mark (point) t)
    (goto-char (- $p0 2))))

(defun _xah-delete-forward-bracket-pairs ( &optional @delete-inner-text-p)
  "Delete the matching brackets/quotes to the right of cursor.
If *delete-inner-text-p is true, also delete the inner text.

After the command, mark is set at the left matching bracket position, so you can `exchange-point-and-mark' to select it.

This command assumes the char to the right of point is a left bracket or quote, and have a matching one after.

What char is considered bracket or quote is determined by current syntax table.

URL `http://ergoemacs.org/emacs/emacs_delete_backward_char_or_bracket_text.html'
Version 2017-07-02"
  (interactive)
  (if @delete-inner-text-p
      (progn
        (mark-sexp)
        (kill-region (region-beginning) (region-end)))
    (let (($pt (point)))
      (forward-sexp)
      (delete-char -1)
      (push-mark (point) t)
      (goto-char $pt)
      (delete-char 1))))

(defun xah-select-text-in-quote ()
  "Select text between the nearest left and right delimiters.
Delimiters here includes the following chars: \"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）
This command select between any bracket chars, not the inner text of a bracket. For example, if text is

 (a(b)c▮)

 the selected char is “c”, not “a(b)c”.

URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
Version 2016-12-18"
  (interactive)
  (let (
        ($skipChars
         (if (boundp 'xah-brackets)
             (concat "^\"" xah-brackets)
           "^\"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）"))
        $pos
        )
    (skip-chars-backward $skipChars)
    (setq $pos (point))
    (skip-chars-forward $skipChars)
    (set-mark $pos)))


(defun xah-select-line ()
  "Select current line. If region is active, extend selection downward by line.
URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
Version 2017-11-01"
  (interactive)
  (if (region-active-p)
      (progn
        (forward-line 1)
        (end-of-line))
    (progn
      (end-of-line)
      (set-mark (line-beginning-position)))))


(defun xah-select-block ()
  "Select the current/next block of text between blank lines.
If region is active, extend selection downward by block.

URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
Version 2017-11-01"
  (interactive)
  (if (region-active-p)
      (re-search-forward "\n[ \t]*\n" nil "move")
    (progn
      (skip-chars-forward " \n\t")
      (when (re-search-backward "\n[ \t]*\n" nil "move")
        (re-search-forward "\n[ \t]*\n"))
      (push-mark (point) t t)
      (re-search-forward "\n[ \t]*\n" nil "move"))))


(global-set-key (kbd "C-H") 'kill-whole-line)

(global-set-key (kbd "C-,") 'avy-goto-word-0-above)
(global-set-key (kbd "C-.") 'avy-goto-word-0-below)
(global-set-key (kbd "C-_") 'undo-tree-undo)
(global-set-key (kbd "C-?") 'undo-tree-redo)

(global-set-key (kbd "C-x u") 'undo-tree-visualize)
(global-set-key (kbd "C-/") nil) ; TODO: keksi jotain käyttöä C-/

(global-set-key (kbd "C-S-v") 'scroll-down-command)
(global-set-key (kbd "C-S-d") 'kill-line)

(global-set-key (kbd "C-S-w") 'kill-ring-save)
(global-set-key (kbd "C-l") 'recenter)

(global-set-key (kbd "C-x 2") 'do-nothing)

; terminal ctrl+key translations:
(define-key key-translation-map (kbd "M-[ ,") (kbd "C-,"))
(define-key key-translation-map (kbd "M-[ .") (kbd "C-."))
(define-key key-translation-map (kbd "M-[ ?") (kbd "C-?"))

(define-key key-translation-map (kbd "M-[ /") (kbd "C-/"))
(define-key key-translation-map (kbd "M-[ -") (kbd "C--"))
(define-key key-translation-map (kbd "M-[ ;") (kbd "C-;"))

(define-key key-translation-map (kbd "M-[ H") (kbd "C-H"))
(define-key key-translation-map (kbd "M-[ <DEL>") (kbd "<DEL>"))
(define-key key-translation-map (kbd "M-[ V") (kbd "C-S-v"))
(define-key key-translation-map (kbd "M-[ #") (kbd "C-S-d"))
(define-key key-translation-map (kbd "M-[ W") (kbd "C-S-w"))

;; copy the original query-replace-function
(fset 'query-replace-wrap-around 'query-replace)
(advice-add 'query-replace-wrap-around
            :around
            #'(lambda (oldfun &rest args)
                (let ((region-active (region-active-p))
                      (start (point)))
                  (apply oldfun args)
                  (if (not region-active)
                      (progn
                        (beginning-of-buffer)
                        (setf (nth 3 args)
                              (point-min))
                        (setf (nth 4 args)
                              start)
                        (apply oldfun args))))))

;; Remap the M-% key
(global-set-key (kbd "M-%") 'query-replace-wrap-around)

(defun reload-config ()
  (interactive)
  (load-file "~/.emacs.el"))

(define-key override-global-map (kbd "C-M-<") 'paredit-backward-slurp-sexp)
(define-key override-global-map (kbd "C-M->") 'paredit-backward-barf-sexp)
(define-key override-global-map (kbd "C-M-,") 'paredit-forward-barf-sexp)
(define-key override-global-map (kbd "C-M-.") 'paredit-forward-slurp-sexp)

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

(defun xah-goto-matching-bracket ()
  "Move cursor to the matching bracket.
If cursor is not on a bracket, call `backward-up-list'.
The list of brackets to jump to is defined by `xah-left-brackets' and `xah-right-brackets'.
URL `http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html'
Version 2016-11-22"
  (interactive)
  (if (nth 3 (syntax-ppss))
      (backward-up-list 1 'ESCAPE-STRINGS 'NO-SYNTAX-CROSSING)
    (cond
     ((eq (char-after) ?\") (forward-sexp))
     ((eq (char-before) ?\") (backward-sexp ))
     ((looking-at (regexp-opt xah-left-brackets))
      (forward-sexp))
     ((looking-back (regexp-opt xah-right-brackets) (max (- (point) 1) 1))
      (backward-sexp))
     (t (backward-up-list 1 'ESCAPE-STRINGS 'NO-SYNTAX-CROSSING)))))

;;;###autoload
(define-minor-mode mikan-mode
  "A minor mode so that my key settings override annoying major modes."
  ;; If init-value is not set to t, this mode does not get enabled in
  ;; `fundamental-mode' buffers even after doing \"(global-mikan-mode 1)\".
  ;; More info: http://emacs.stackexchange.com/q/16693/115
  :init-value t
  :lighter " mikan-mode"
  :keymap (let ((map (make-sparse-keymap)))
  ; (define-key map (kbd "C-l") 'windmove-right)
  ; (define-key map (kbd "<DEL>") 'windmove-left)
  ; (define-key map (kbd "<f12>") 'evil-local-mode)
  ; (define-key map (kbd "C-a") 'confirm-quit)
  ;
  ; TODO: keksi jotain käyttöä C-/
  ; TODO: eli tämä (normaalissa .emacs toplevelissä)
  ; (global-set-key (kbd "C-/") 'avy-goto-word-0-above)
  ; ei toimi mutta tämä
            (define-key map (kbd "C-/") 'do-nothing)
  ; toimii?
            map))

(defun do-nothing ()
  (interactive)
  nil)

(global-set-key (kbd "<ESC> 1") (lambda() (interactive) (window-number-select 1)))
(global-set-key (kbd "<ESC> 2") (lambda() (interactive) (window-number-select 2)))
(global-set-key (kbd "<ESC> 3") (lambda() (interactive) (window-number-select 3)))
(global-set-key (kbd "<ESC> 4") (lambda() (interactive) (window-number-select 4)))
(global-set-key (kbd "<ESC> 5") (lambda() (interactive) (window-number-select 5)))
(global-set-key (kbd "<ESC> 6") (lambda() (interactive) (window-number-select 6)))
(global-set-key (kbd "<ESC> 7") (lambda() (interactive) (window-number-select 7)))
(global-set-key (kbd "<ESC> 8") (lambda() (interactive) (window-number-select 8)))
(global-set-key (kbd "<ESC> 9") (lambda() (interactive) (window-number-select 9)))
(global-set-key (kbd "<ESC> 0") (lambda() (interactive) (window-number-select 10)))

(global-set-key (kbd "C-v") 'ccm-scroll-up)
(global-set-key (kbd "C-S-v") 'ccm-scroll-down)

;;;###autoload
(define-globalized-minor-mode global-mikan-mode mikan-mode mikan-mode)

;; https://github.com/jwiegley/use-package/blob/master/bind-key.el
;; The keymaps in `emulation-mode-map-alists' take precedence over
;; `minor-mode-map-alist'
(add-to-list 'emulation-mode-map-alists `((mikan-mode . ,mikan-mode-map)))

;; Turn off the minor mode in the minibuffer
(defun turn-off-mikan-mode ()
  "Turn off mikan-mode."
  (mikan-mode -1))
(add-hook 'minibuffer-setup-hook #'turn-off-mikan-mode)

(provide 'mikan-mode)

(load-theme 'bw-light t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("20cbcb52e124480d194ed223b353988d7e6c3fb5ea9d805462919482f4f4db33" "6c5b472857ef213f813e0e044b8de1d935f877d8f69df3d950aa3a11fa5c2d7a" "c524396cf54e7a308ab36b1fda3950960145cb5a2eb05d8ff6537e5e6cbac257" "638ef265a6d0b3ca46aef981a4ad6daf1936875dfe56e212f8289865046fbc99" default)))
 '(package-selected-packages
   (quote
    (adjust-parens zop-to-char xah-elisp-mode window-number which-key use-package slime evil change-inner centered-cursor-mode avy)))
 '(window-number-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(undo-tree-visualizer-current-face ((t (:background "dim gray")))))
