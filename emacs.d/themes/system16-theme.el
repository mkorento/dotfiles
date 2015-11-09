(deftheme system16)

(let ((background "#080808")
      (current-line "#303030")
      (selection "#a59f85")
      (foreground "#FFFF5F")
      (comment "#A8A8A8")
      (cursor "#f5f4f1")
      (black "#080808")
      (darkgrey "#585858")
      (darkred "#AF0000")
      (darkgreen "#00AF00")
      (darkyellow "#AF5F00")
      (darkblue "#0000AF")
      (darkmagenta "#AF00AF")
      (darkcyan "#00AFAF")
      (grey "#A8A8A8")
      (red "#FF5F5F")
      (green "#5FFF5F")
      (yellow "#FFFF5F")
      (blue "#5F5FFF")
      (magenta "#FF5FFF")
      (cyan "#5FFFFF")
      (white "#FFFFFF"))

  (custom-theme-set-faces
   'system16

   ;; Built-in stuff (Emacs 23)
   `(default ((t (:background ,black :foreground ,yellow))))
   `(fringe ((t (:background ,black))))
   `(minibuffer-prompt ((t (:foreground ,yellow))))
   `(mode-line ((t (:background ,current-line :foreground ,yellow))))
   `(region ((t (:foreground ,cyan :background ,darkblue))))

   `(trailing-whitespace ((t (:foreground ,black :background ,darkred))))
   `(isearch ((t (:foreground ,white :background ,darkred))))
   `(lazy-highlight ((t (:foreground ,black :background ,darkred))))

   ;; Font-lock stuff
   `(vertical-border ((t (:foreground ,black :background ,darkgrey))))
   `(font-lock-comment-face ((t (:foreground ,grey))))
   `(font-lock-constant-face ((t (:foreground ,darkgreen))))
   `(font-lock-doc-string-face ((t (:foreground ,grey))))
   `(font-lock-function-name-face ((t (:foreground ,darkgreen))))
   `(font-lock-keyword-face ((t (:foreground ,darkred))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,cyan))))
   `(font-lock-variable-name-face ((t (:foreground ,darkcyan))))
   `(font-lock-warning-face ((t (:foreground ,red))))

   ;; hl-line-mode
   `(hl-line ((t (:foreground ,cyan :background ,darkblue))))

   ;; linum-mode
   `(linum ((t (:background ,black :foreground ,darkred))))

   ;; org-mode
   `(org-date ((t (:foreground ,blue))))
   `(org-done ((t (:foreground ,green))))
   `(org-hide ((t (:foreground ,current-line))))
   `(org-link ((t (:foreground ,blue))))
   `(org-todo ((t (:foreground ,red))))

   ;; show-paren-mode
   `(show-paren-match ((t (:background ,blue :foreground ,current-line))))
   `(show-paren-mismatch ((t (:background ,red :foreground ,current-line))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,magenta))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,blue))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,cyan))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,green))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,yellow))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,darkyellow))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,red))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,grey))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,yellow)))))

  (custom-theme-set-variables
   'system16

   `(ansi-color-names-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [,black ,red ,green ,yellow ,blue ,magenta ,blue ,white])
   `(ansi-term-color-vector
     ;; black, red, green, yellow, blue, magenta, cyan, white
     [black ,red ,green ,yellow ,blue ,magenta ,blue ,white])))

(set-face-attribute 'mode-line-inactive nil :background "#303030" :foreground "#303030")

(set-face-attribute 'mode-line nil :background "#303030" :foreground "#A8A8A8")
(set-frame-parameter (selected-frame) 'internal-border-width 15)
;(set-face-attribute 'mode-line-buffer-id nil :background nil :foreground "#ffffff")
;(set-face-attribute 'powerline-active2 nil :background "#585858" :foreground "#ffffff")
;(set-face-attribute 'powerline-inactive1 nil :background "#c6c6c6" :foreground "#585858")
;(set-face-attribute 'powerline-inactive2 nil :background "#e4e4e4" :foreground "#585858")
;(set-face-attribute 'powerline-active1 nil :background "#afd7ff" :foreground "#005faf")

(load "~/.emacs.d/themes/modeline")
(provide-theme 'system16)
