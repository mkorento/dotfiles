(defun modeline ()
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (if active
                                         (let ((evil-face (powerline-evil-face)))
                                           (if evil-mode
                                               (powerline-raw (powerline-evil-tag) evil-face)))
                                         nil)
                                     (powerline-buffer-id `(mode-line-buffer-id ,mode-line) 'l)
                                     (when (buffer-modified-p)
                                       (powerline-raw " [+]" mode-line))
                                     (when buffer-read-only
                                       (powerline-raw "[RO]" mode-line))
                                     ;(funcall separator-left mode-line face1)
                                     (powerline-narrow face1 'l)
                                     (powerline-vc face1)))
                          (rhs (list (powerline-raw (format "%s" buffer-file-coding-system) mode-line 'r)
                                     (powerline-major-mode mode-line)
                                     (powerline-process mode-line)
                                     ;(powerline-raw "[%z]" mode-line)
                                     ;(powerline-raw '(10 "%i"))
                                     (powerline-raw global-mode-string mode-line 'r)
                                     (powerline-raw " " mode-line 'l)
                                     (funcall separator-left mode-line face1)
                                     (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))) mode-line 'r)
                                     (funcall separator-left mode-line face1)
                                     (powerline-raw "LN %3l:" mode-line 'l)
                                     (powerline-raw (format-mode-line '(3 "%c"))))))
                     (concat (powerline-render lhs)
                             (powerline-fill mode-line (powerline-width rhs))
                             (powerline-render rhs)))))))

(modeline)
