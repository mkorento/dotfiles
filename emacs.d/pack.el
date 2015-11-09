(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)

(use-package ace-jump-mode
  :ensure ace-jump-mode)

(use-package bind-key
  :ensure bind-key)

(use-package color-theme-approximate
  :ensure color-theme-approximate)

(use-package diminish
  :ensure diminish)

(use-package evil
  :ensure evil)

(use-package evil-easymotion
  :ensure evil-easymotion)

(use-package evil-leader
  :ensure evil-leader)

(use-package evil-surround
  :ensure evil-surround)

(use-package goto-chg
  :ensure goto-chg)

(use-package key-chord
  :ensure key-chord)

(use-package noflet
  :ensure noflet)

(use-package powerline
  :ensure powerline)

(use-package powerline-evil
  :ensure powerline-evil)

(use-package slime
  :ensure slime)

(use-package undo-tree
  :ensure undo-tree)

(use-package yasnippet
  :ensure yasnippet)

(use-package rainbow-delimiters
  :ensure rainbow-delimiters)
