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

(use-package evil
  :ensure evil)

(use-package slime
  :ensure slime)

(use-package evil-surround
  :ensure evil-surround)

; (use-package ace-jump-mode
;   :ensure ace-jump-mode)

; (use-package evil-easymotion
;   :ensure evil-easymotion)
