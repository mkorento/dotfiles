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
  :ensure undo-tree)

(use-package window-number
  :ensure window-number)

(use-package avy
  :ensure avy
  :commands avy-goto-char avy-goto-word-0-above avy-goto-word-0-below
  :init
  (setq
   avy-keys
   '(?h ?u ?t ?e ?n ?o ?s ?a ?d ?i ?b ?k ?g ?p ?c ?. ?r ?, ?f ?x ?w ?v ?; ?l ?')))
