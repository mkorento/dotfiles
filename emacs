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
; paskat vittuun
(blink-cursor-mode 0)
(setq history-length 500)
(setq visible-cursor nil)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
; wrapping pois
(set-default 'truncate-lines t)
(setq-default show-trailing-whitespace t)

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

(setq-default major-mode 'text-mode)
(setq split-height-threshold nil)
(setq split-width-threshold 0)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq x-select-enable-clipboard t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)
(setq inhibit-splash-screen t)
(setq echo-keystrokes 0.01)
(menu-bar-mode -1)
(setq auto-save-default t)
(setq ring-bell-function 'ignore)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)
(setq create-lockfiles nil)

(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(setq savehist-file "~/.emacs.d/tmp/savehistory")

(defconst emacs-tmp-dir (concat user-emacs-directory "tmp/"))
(setq backup-directory-alist
    `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
    `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
    emacs-tmp-dir)

(add-hook 'post-command-hook 'balance-windows)

; (add-hook 'text-mode-hook 'evil-local-mode)
; (add-hook 'prog-mode-hook 'evil-local-mode)
; (add-hook 'undo-tree-mode-hook 'evil-local-mode)

(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)
(define-key minibuffer-local-map (kbd "C-u") 'kill-whole-line)



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

(define-key key-translation-map (kbd "M-[ -") (kbd "C--"))

(global-set-key (kbd "<ESC> ,") 'avy-goto-word-0-above)
(global-set-key (kbd "<ESC> .") 'avy-goto-word-0-below)

; X11
(global-set-key (kbd "C-,") 'avy-goto-word-0-above)
(global-set-key (kbd "C-.") 'avy-goto-word-0-below)
(global-set-key (kbd "C-?") 'undo-tree-redo)

; terminal
(global-set-key (kbd "M-[ ,") 'avy-goto-word-0-above)
(global-set-key (kbd "M-[ .") 'avy-goto-word-0-below)
(global-set-key (kbd "M-[ ?") 'undo-tree-redo)

(defun reload-config ()
  (interactive)
  (load-file "~/.emacs"))

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

(define-key 'help-command (kbd "C-i") #'info-display-manual)
(global-set-key (kbd "M-[ <DEL>") 'kill-whole-line)

; TODO: keksi jotain käyttöä C-/
(global-set-key (kbd "M-[ /") nil)

(setq mode-line-format
      (list
        "%e"
        ; mode-line-front-space
        ; mode-line-mule-info
        ; mode-line-client
        ; mode-line-modified
        ; mode-line-remote
        ; mode-line-frame-identification
        ; mode-line-buffer-identification
        ; "   "
        ; mode-line-position
        ; (vc-mode vc-mode)
        ; "  "
        ; mode-line-modes
        ; mode-line-misc-info
        mode-line-end-spaces))

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

; (defun confirm-quit ()
;   (interactive)
;   (catch 'outer
;     (progn
;       (defun recurr ()
;         (let ((chr (read-char ":CQuit")))
;           (cond ((char-equal chr ?y) (kill-emacs))
;                 ((char-equal chr ?n) (throw 'outer nil))
;                 (t (recurr)))))
;       (recurr))))

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
 '(window-number-mode nil))
