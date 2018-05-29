(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(defconst savefile-dir (expand-file-name "savefile" user-emacs-directory))
(unless (file-exists-p savefile-dir)
  (make-directory savefile-dir))

(require 'saveplace)
(use-package saveplace
  :config
  (setq save-place-file (expand-file-name "saveplace" savefile-dir))
  ;; activate it for all buffers
  (setq-default save-place t))

(use-package slime
  :ensure slime)

(use-package undo-tree
  :ensure undo-tree
  :config
   (setq undo-tree-history-directory-alist
    `((".*" . ,(concat user-emacs-directory "undo-tree-history/"))))
  (global-undo-tree-mode))

(use-package window-number
  :ensure window-number
  :config
  (window-number-mode 1))

(use-package avy
  :ensure avy
  :commands avy-goto-char avy-goto-word-0-above avy-goto-word-0-below
  :init
  (setq
   avy-keys
   '(?h ?u ?t ?e ?n ?o ?s ?a ?d ?i ?b ?k ?g ?p ?c ?r ?f ?x ?w ?v ?l )))

(use-package whitespace
  :ensure whitespace
  :config
  (setq whitespace-line-column 80)
  (setq whitespace-style '(face tab-mark lines-tail))
  (setq whitespace-display-mappings
            '((tab-mark   ?\t [?\xBB])))
  (global-whitespace-mode +1))

(use-package zop-to-char
  :ensure t
  :bind (("M-z" . zop-up-to-char)
         ("M-Z" . zop-to-char)))

(use-package which-key
  :ensure t
  :config
  (setq which-key-idle-delay 0.01)
  (which-key-mode +1))

(use-package centered-cursor-mode
  :ensure t
  :config
  (centered-cursor-mode)
  (global-centered-cursor-mode +1))
