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

; pieni padding numeroiden ja tekstin väliin
(setq linum-format "%d ")

(setq-default major-mode 'text-mode)
(setq split-height-threshold nil)
(setq split-width-threshold 0)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq x-select-enable-clipboard t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)
(setq inhibit-splash-screen t)
(setq echo-keystrokes 0.01)
(switch-to-buffer "*scratch*")
(menu-bar-mode -1)
(setq auto-save-default nil)

(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(setq savehist-file "~/.emacs.d/savehist/savehistory")

(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5a9e0f208177b85047c9e8e961ce0f646d7d23264af0afe0699ac5899fbf57f6" "c1e49adde93f347b35ebd8df82ae7f09f0f2d0a2395613e78d4468d1b1c6a4e0" default))))

(add-hook 'text-mode-hook 'evil-local-mode)
(add-hook 'prog-mode-hook 'evil-local-mode)
(add-hook 'undo-tree-mode-hook 'evil-local-mode)

(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)
(define-key minibuffer-local-map (kbd "C-u") 'kill-whole-line)

; (define-key minibuffer-local-map (kbd "C-p") 'previous-history-element)
; (define-key minibuffer-local-map (kbd "C-n") 'next-history-element)

; for vim users
(defalias 'vs 'split-window-horizontally)
(defalias 'clo 'delete-window)

; evil
(defun evil-local-mode-fixed-escape ()
  "Turn on Evil in the current buffer AND `evil-esc-mode'. This makes C-[ work
   like <escape> when using `evil-local-mode'."
  (interactive)
  (progn
    (turn-on-evil-mode)
    (evil-esc-mode 1)))

(defun evil-local-mode-fixed-escape-toggle ()
  "Toggle Evil on/off in the current buffer AND `evil-esc-mode'. This makes C-[
   work like <escape> when using `evil-local-mode'."
  (interactive)
  (if evil-local-mode
    (progn
      (message "evil-mode off")
      (turn-off-evil-mode)
      (evil-esc-mode 0))
    (progn
      (turn-on-evil-mode)
      (evil-esc-mode 1))))

; (setq evil-insert-state-message nil)

(define-key evil-insert-state-map (kbd "C-a") 'confirm-quit)
(define-key evil-normal-state-map (kbd "C-a") 'confirm-quit)

(define-key evil-insert-state-map (kbd "<ESC>") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "<DEL>") 'backward-delete-char-untabify)

(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "<DEL>") 'windmove-left)

(define-key evil-normal-state-map (kbd "Q") (kbd "@@"))

(define-key evil-normal-state-map (kbd "C-]") 'my-jump-to-tag)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)


(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

; (evil-define-key 'normal slime-repl-mode-map (kbd "j")
            ; 'slime-repl-forward-input)
; (evil-define-key 'normal slime-repl-mode-map (kbd "k")
;             'slime-repl-backward-input)
; (evil-define-key 'normal slime-repl-mode-map (kbd "RET")
;             'slime-repl-return)

(setq inferior-lisp-program "sbcl")

; (setq slime-contribs '(slime-fancy))
; (add-to-list 'slime-contribs 'slime-trace-dialog)
; (slime-setup '(slime-repl))

;;;###autoload
(define-minor-mode my-mode
  "A minor mode so that my key settings override annoying major modes."
  ;; If init-value is not set to t, this mode does not get enabled in
  ;; `fundamental-mode' buffers even after doing \"(global-my-mode 1)\".
  ;; More info: http://emacs.stackexchange.com/q/16693/115
  :init-value t
  :lighter " my-mode"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-l") 'windmove-right)
            (define-key map (kbd "<DEL>") 'windmove-left)
            (define-key map (kbd "<f12>") 'evil-local-mode)
            (define-key map (kbd "C-a") 'confirm-quit)
            map))

(defun confirm-quit ()
  (interactive)
  (catch 'outer
    (progn
      (defun recurr ()
        (let ((chr (read-char ":CQuit")))
          (cond ((char-equal chr ?y) (kill-emacs))
                ((char-equal chr ?n) (throw 'outer nil))
                (t (recurr)))))
      (recurr))))

;;;###autoload
(define-globalized-minor-mode global-my-mode my-mode my-mode)

;; https://github.com/jwiegley/use-package/blob/master/bind-key.el
;; The keymaps in `emulation-mode-map-alists' take precedence over
;; `minor-mode-map-alist'
(add-to-list 'emulation-mode-map-alists `((my-mode . ,my-mode-map)))

;; Turn off the minor mode in the minibuffer
(defun turn-off-my-mode ()
  "Turn off my-mode."
  (my-mode -1))
(add-hook 'minibuffer-setup-hook #'turn-off-my-mode)

(provide 'my-mode)

(load-theme 'bw-light)

