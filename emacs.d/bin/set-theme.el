(defvar *colour-state* "~/.vim/autoload/changecolour/.misc/status")
(defvar *current-theme* "dark\n")

(defun SC ()
  (interactive)
  (if (string= (get-string-from-file *colour-state*) "light\n")
      (progn
        (load-theme 'system16-light t)
        (setq *current-theme* "light\n"))
    (progn
      (load-theme 'system16 t)
      (setq *current-theme* "dark\n"))))

(defun CC ()
  (interactive)
  (progn
   (if (string= (get-string-from-file *colour-state*) "dark\n")
       (progn
        (write-region "light\n" nil *colour-state*)
        (setq *current-theme* "light\n"))
     (progn
      (write-region "dark\n" nil *colour-state*)
      (setq *current-theme* "dark\n")))
   (SC)))

(defun UC ()
  (interactive)
  (unless (string= (get-string-from-file *colour-state*)
                   *current-theme*)
    (SC)))

(defun get-string-from-file (filePath)
  "Return filePath's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))
