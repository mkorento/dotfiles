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
(switch-to-buffer "*scratch*")
(menu-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fa01fef90cda2ba20db4afdb95af424037901f7fb2eaa02746fccb47bd3d81ec" "df6e41354524151b4201100b073d3893c6f693c2f99e884064a395c631680b34" "da05fb281063e8c642a1fce22e569d08fe8b632e98fabc4a184005123728fcc3" "f10f5dd98e0ff40f94965f4d7c5fcdd57ecc8727728385bcc4fde47e6225260e" "9ee943377c57f9ec40e5f50dc540aff176ddb2a991a92ef5050ae1d40bb45de4" "61b93a0e6a9b3c412ff2e767fb7d7e4dd8639a3b27131e0fc61af5ed29dbe1ab" "72d55949c3b84d2ec36f5fede3f5d65ec748a7f148fad1c1ee3d55ba5fcc24d4" "c5ec6b946fbd01983d5725049b292ca722b49305c8a77447b386f6c4fa09c4ee" "ab2072ec742ce0342a25eda583f9d1adbc52eb722d580847f997666d9af321a6" "34fb87d87175f4ba18102607517b5b8efa6cdab2426316dd94fa039034fce9ae" "9b54bf67de7206ec94d24957ccb9a7fc706eb798c5c6a6a0a9280e9700e74cfa" "9ad8525399d368a2cae7e828129c9d6efc0bec56ef1fad321bbb1b1c1d895460" "edc3652b0cee817da6fda2b6a1fdf70d3cddbe553e735e696fa176e8d72118b2" "564f16645411528cc63b2c240a46667bce34c437819b23c3452820b302d1b5be" "690620c3a3bbb2c0ec643078a40945ebfef77d2415ce9ed351a6cd8fbf9bdc59" "82b1c4519500fde109b99f61f4530bb2f904f3d195b9b81e2415ff5dd59060be" "11d8dcc0b38fd4d4feabb006219fd72362023fb08b30f1c2a06e071b24d74368" "ff5bb31683e86bdbb1112b7c3ed8728e2be58e855a3a1db8beecb135f2179da2" "75cdd12b87028f02aedddad64069a2fd1b1b6985204dcdd771c82d82c6ca9969" "2ebbb86d759021a5c1a19ea82cccf8d159fedc5e18b231ffc52960920db1ef0f" "46db6dbe921539233363ff26656ea45da93512dfea3eed6b424617a2bf012658" "6445eef8b55ec1d571a53be5da85d4775c5ee9ed13c3be7eabf27cda60bf37b0" "d7ffe8766518c7918c443fb30d2cb13d0265edd4c3cd2a809fc92a56fb7a6333" "6164024118a2ebb88f160cf5a6c8238f3e19778ae937f0dfe055f059940ce125" "10e18ccedcb820efcd52b1d1a3ed3ad7eaeeb90dd4fd0888e4618f526d967b9f" "4395dfeb63275a916a63d875590d77db12aee220b96903a9ea3bf362632d5f9f" "160516f3f13ee4c39974328ed4df283a4e559a94ea922c828b8be3794695e175" "c69d3b73e29fa06e69a892ea9c56ea3635dad9e4c65d7144fbaa386cc98e7da3" "7a3dc4e60160c15cb819fb877bde07ebbadcafb08c4e7f6784f5cb80c7420b68" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(echo-keystrokes 0.01))

(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(add-hook 'text-mode-hook 'evil-local-mode-fixed-escape)
(add-hook 'prog-mode-hook 'evil-local-mode-fixed-escape)

(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)
(define-key minibuffer-local-map (kbd "C-u") 'kill-whole-line)

; for vim users
(defalias 'vs 'split-window-horizontally)
(defalias 'clo 'delete-window)

; evil
(defun evil-local-mode-fixed-escape ()
  "Turn on Evil in the current buffer AND `evil-esc-mode'. This makes C-[ work
   like <escape> when using `evil-local-mode'."
  (interactive)
  (if evil-local-mode
    (progn
      (message "evil-mode off")
      (turn-off-evil-mode)
      (evil-esc-mode 0))
    (progn
      (turn-on-evil-mode)
      (evil-esc-mode 1))))

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
            (define-key map (kbd "<f12>") 'evil-local-mode-fixed-escape)
            map))

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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
