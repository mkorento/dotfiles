(global-set-key (kbd "C-a") 'kill-emacs)
(global-set-key (kbd "C-h") (kbd "<DEL>"))

(global-set-key (kbd "<f2>") 'previous-buffer)
(global-set-key (kbd "<f3>") 'next-buffer)

(define-key minibuffer-local-map (kbd "C-a") 'kill-emacs)
(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)
(define-key minibuffer-local-map (kbd "C-u") 'kill-whole-line)

(set-language-environment "UTF-8")
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(setq backup-directory-alist
      `((".*" . "~/.emacs.d/backup/")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/autosave/" t)))

(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(load "~/.emacs.d/pack")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "~/.emacs.d/undo-tree")
(add-to-list 'load-path "~/.emacs.d/elpa")

(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.lisp\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.gdl\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.gendl\\'" . lisp-mode))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-max-face-count 8))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#5F5FFF"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#FF5F5F"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#AF00AF"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#00AF00"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#AF0000"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#FF5FFF"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#00AFAF"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#A8A8A8"))))
 '(rainbow-delimiters-depth-9-face ((t nil))))

(require 'evil)
(require 'undo-tree)

(global-linum-mode t)
(setq linum-format
      (lambda (line)
        (propertize (format (let ((w (length
                                      (number-to-string
                                       (count-lines
                                        (point-min)
                                        (point-max))))))
                              (concat "%"
                                      (number-to-string
                                       w) "d "))
                            line) 'face 'linum)))
(evil-mode 1)

(evilem-default-keybindings "C-\\")

(setq yas-snippet-dirs
      '("~/.emacs.d/custom-snippets"
        "~/.emacs.d/snippets"))

(yas-global-mode 1)

;(setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
;(setq evil-emacs-state-modes nil)

; (load (expand-file-name "~/quicklisp/slime-helper.el"))

(setq-default truncate-lines t)
(setq inferior-lisp-program "sbcl")
;; optionally, some contribs
(setq slime-contribs '(slime-fancy))
(add-to-list 'slime-contribs 'slime-trace-dialog)
(slime-setup '(slime-repl))

(color-theme-approximate-on)

(setq-default show-trailing-whitespace t)

(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "Q") (kbd "@@"))

(define-key evil-insert-state-map (kbd "C-h") (kbd "<DEL>"))
(define-key evil-normal-state-map (kbd "C-]") 'my-jump-to-tag)
(define-key evil-normal-state-map (kbd "C-[") 'kill-emacs)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

(define-key evil-normal-state-map (kbd "C-e") (kbd ":w!"))
(define-key evil-visual-state-map (kbd "C-e") (kbd "<escape>:w!"))
(define-key evil-insert-state-map (kbd "C-e") (kbd "<escape>:w!"))

(define-key minibuffer-local-completion-map "\M- "
    (lambda () (interactive) (insert " ")))

(evil-define-key 'normal slime-repl-mode-map (kbd "j")
            'slime-repl-forward-input)
(evil-define-key 'normal slime-repl-mode-map (kbd "k")
            'slime-repl-backward-input)
(evil-define-key 'normal slime-repl-mode-map (kbd "RET")
            'slime-repl-return)

(global-evil-leader-mode)
(evil-leader/set-leader "\\")
(evil-leader/set-key "w" 'evil-window-vsplit)
(evil-leader/set-key "m" 'evil-window-split)
(evil-leader/set-key "=" 'evil-window-delete)
(setq evil-leader/in-all-states 1)

(require 'powerline)
(require 'powerline-evil)

(menu-bar-mode -1)

(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

(setq-default indent-tabs-mode nil)
(load "~/.emacs.d/bin/set-theme")
(add-hook 'after-save-hook #'UC)
(SC)

; vim: ft=lisp
