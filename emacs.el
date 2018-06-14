(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(load "~/.emacs.d/pack.el")
(load "~/.emacs.d/xah-lisp-editing-functions.el")

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
(setq vc-follow-symlinks t)
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
(setq initial-scratch-message ";; LISP CODE\n\n")

; X11 keybindings
(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)
(define-key minibuffer-local-map (kbd "C-u") 'kill-whole-line)

(global-set-key (kbd "M-f") 'vim-forward-word)

(defun vim-forward-word ()
  (interactive)
  (forward-word)
  (forward-word)
  (backward-word))

(global-set-key (kbd "C-o") 'open-line-above)
(global-set-key (kbd "<C-S-return>") 'open-line-below)
(global-set-key (kbd "S-RET") 'open-line-below)

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (open-line 1))

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (execute-kbd-macro (kbd "\r")))

; keybindings for lisp-editing
(global-set-key (kbd "M-,") 'xah-backward-left-bracket)
(global-set-key (kbd "M-.") 'xah-forward-right-bracket)
(global-set-key (kbd "M-h") 'xah-select-block)
(global-set-key (kbd "M-\\") 'xah-select-line)
(global-set-key (kbd "M-i") 'xah-select-text-in-quote)
(global-set-key (kbd "M-p") 'xah-extend-selection)
(global-set-key (kbd "<M-tab>") 'xah-goto-matching-bracket)
(global-set-key (kbd "C-[ TAB") 'xah-goto-matching-bracket)
(global-set-key (kbd "TAB") 'xah-elisp-prettify-root-sexp)

(global-set-key (kbd "C-H") 'kill-region-or-kill-whole-line)

(global-set-key (kbd "C-w") 'kill-word-or-region)

(defun kill-word-or-region ()
  (interactive)
  (if (region-active-p)
      (kill-region (mark) (point))
    (backward-kill-word 1)))

(global-set-key (kbd "C-x C-+") 'do-nothing)
(global-set-key (kbd "C-x C--") 'do-nothing)

(add-to-list 'display-buffer-alist
             '("*Help*" display-buffer-same-window))

(add-to-list 'same-window-buffer-names "*info*")
(add-to-list 'same-window-buffer-names "*Help*")
(add-to-list 'same-window-buffer-names "*Disabled Command*")

(defun kill-region-or-kill-whole-line ()
  (interactive)
  (if (region-active-p)
      (if (eolp)
          (kill-region (mark) (+ 1 (point)))
        (kill-region (mark) (point)))
    (kill-whole-line)))

(global-set-key (kbd "C-,") 'avy-goto-word-0-above)
(global-set-key (kbd "C-.") 'avy-goto-word-0-below)
(global-set-key (kbd "C-_") 'undo-tree-undo)
(global-set-key (kbd "C-?") 'undo-tree-redo)

(global-set-key (kbd "C-x u") 'undo-tree-visualize)

(global-set-key (kbd "C-S-v") 'scroll-down-command)
(global-set-key (kbd "C-M-(") 'paredit-splice-sexp)
(global-set-key (kbd "C-M-9") 'paredit-wrap-round)
(global-set-key (kbd "C-S-d") 'paredit-kill)
; (global-set-key (kbd "C-S-d") 'kill-line)

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

;;;###autoload
(define-minor-mode my-overriding-global-keybindings
  "A minor mode so that my key settings override annoying major modes."
  ;; If init-value is not set to t, this mode does not get enabled in
  ;; `fundamental-mode' buffers even after doing \"(global-my-overriding-global-keybindings 1)\".
  ;; More info: http://emacs.stackexchange.com/q/16693/115
  :init-value t
  :lighter " my-overriding-global-keybindings"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-M-<") 'paredit-backward-slurp-sexp)
            (define-key map (kbd "C-M->") 'paredit-backward-barf-sexp)
            (define-key map (kbd "C-M-,") 'paredit-forward-barf-sexp)
            (define-key map (kbd "C-M-.") 'paredit-forward-slurp-sexp)
            (define-key map (kbd "C-(") 'do-nothing)
            (define-key map (kbd "C-)") 'do-nothing)
            (define-key map (kbd "C-{") 'do-nothing)
            (define-key map (kbd "C-}") 'do-nothing)
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
(define-globalized-minor-mode global-my-overriding-global-keybindings my-overriding-global-keybindings my-overriding-global-keybindings)

;; https://github.com/jwiegley/use-package/blob/master/bind-key.el
;; The keymaps in `emulation-mode-map-alists' take precedence over
;; `minor-mode-map-alist'
(add-to-list 'emulation-mode-map-alists `((my-overriding-global-keybindings . ,my-overriding-global-keybindings-map)))

;; Turn off the minor mode in the minibuffer
(defun turn-off-my-overriding-global-keybindings ()
  "Turn off my-overriding-global-keybindings."
  (my-overriding-global-keybindings -1))
(add-hook 'minibuffer-setup-hook #'turn-off-my-overriding-global-keybindings)

(provide 'my-overriding-global-keybindings)

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
