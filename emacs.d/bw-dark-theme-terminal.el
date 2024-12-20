(defconst *black* "black")
(defconst *red* "red")
(defconst *green* "green")
(defconst *yellow* "yellow")
(defconst *blue* "blue")
(defconst *magenta* "magenta")
(defconst *cyan* "cyan")
(defconst *white* "white")
(defconst *brightblack* "brightblack")
(defconst *brightred* "brightred")
(defconst *brightgreen* "brightgreen")
(defconst *brightyellow* "brightyellow")
(defconst *brightblue* "brightblue")
(defconst *brightmagenta* "brightmagenta")
(defconst *brightcyan* "brightcyan")
(defconst *brightwhite* "brightwhite")

(defconst *foreground* *brightblack*)
(defconst *background* *black*)

(deftheme bw-dark
  "Created 2018-05-17.")

(custom-theme-set-faces
 'bw-dark
 `(avy-lead-face ((t (:foreground ,*brightred* :background ,*background*))))
 `(avy-lead-face-0 ((t (:foreground ,*brightred* :background ,*background*))))
 `(avy-lead-face-1 ((t (:foreground ,*brightred* :background ,*background*))))
 `(avy-lead-face-2 ((t (:foreground ,*brightred* :background ,*background*))))
 `(avy-background-face ((t (:foreground ,*brightblack*))))
 `(whitespace-line ((t (:background ,*background* :foreground ,*red*))))
 `(region ((t (:background ,*foreground* :foreground ,*background*))))
 `(secondary-selection ((t (:background ,*brightyellow* :foreground ,*background*))))
 `(trailing-whitespace ((t (:foreground ,*red* :underline t))))
 `(header-line ((t (:inherit default :inverse-video nil :underline t))))
 `(lazy-highlight ((t (:background ,*brightblack* :foreground ,*background*))))
 `(isearch ((t (:background ,*white* :foreground ,*background*))))
 `(mode-line ((t (:background ,*foreground* :foreground ,*background*))))
 `(mode-line-inactive ((t (:background ,*background* :foreground ,*background*))))
 `(query-replace ((t (:inherit (isearch)))))
 `(font-lock-comment-face ((t (:foreground ,*foreground*))))
 `(font-lock-string-face ((t (:foreground ,*foreground*))))
 `(fringe ((t (:background ,*background* :foreground ,*blue*))))
 `(window-divider ((t (:background ,*background* :foreground ,*blue*))))
 `(vertical-border ((t (:background ,*foreground* :foreground ,*background*))))
 `(border ((t (:background ,*foreground* :foreground ,*background*))))
 `(completions-annotations ((t nil)))
 `(cursor ((t nil)))
 `(button ((t nil)))
 `(custom-button ((t nil)))
 `(custom-button-mouse ((t nil)))
 `(custom-button-pressed ((t nil)))
 `(custom-button-pressed-unraised ((t nil)))
 `(custom-button-unraised ((t nil)))
 `(custom-changed ((t nil)))
 `(custom-comment ((t nil)))
 `(custom-comment-tag ((t nil)))
 `(custom-documentation ((t nil)))
 `(custom-face-tag ((t nil)))
 `(custom-group-subtitle ((t nil)))
 `(custom-group-tag ((t nil)))
 `(custom-group-tag-1 ((t nil)))
 `(custom-invalid ((t nil)))
 `(custom-link ((t nil)))
 `(custom-modified ((t nil)))
 `(custom-rogue ((t nil)))
 `(custom-saved ((t nil)))
 `(custom-set ((t nil)))
 `(custom-state ((t nil)))
 `(custom-themed ((t nil)))
 `(custom-variable-button ((t nil)))
 `(custom-variable-tag ((t nil)))
 `(custom-visibility ((t nil)))
 `(error ((t nil)))
 `(escape-glyph ((t nil)))
 `(evil-ex-commands ((t nil)))
 `(evil-ex-info ((t nil)))
 `(evil-ex-substitute-replacement ((t nil)))
 `(file-name-shadow ((t nil)))
 `(flyspell-duplicate ((t nil)))
 `(flyspell-incorrect ((t nil)))
 `(font-lock-builtin-face ((t nil)))
 `(font-lock-constant-face ((t nil)))
 `(font-lock-doc-face ((t nil)))
 `(font-lock-function-name-face ((t nil)))
 `(font-lock-keyword-face ((t nil)))
 `(font-lock-negation-char-face ((t nil)))
 `(font-lock-preprocessor-face ((t nil)))
 `(font-lock-regexp-grouping-backslash ((t nil)))
 `(font-lock-regexp-grouping-construct ((t nil)))
 `(font-lock-string-face ((t nil)))
 `(font-lock-type-face ((t nil)))
 `(font-lock-variable-name-face ((t nil)))
 `(font-lock-warning-face ((t nil)))
 `(glyphless-char ((t nil)))
 `(help-argument-name ((t nil)))
 `(highlight ((t nil)))
 `(info-index-match ((t nil)))
 `(info-menu-header ((t nil)))
 `(info-menu-star ((t nil)))
 `(info-title-1 ((t nil)))
 `(info-title-2 ((t nil)))
 `(info-title-3 ((t nil)))
 `(info-title-4 ((t nil)))
 `(isearch-fail ((t nil)))
 `(italic ((t nil)))
 `(link ((t nil)))
 `(link-visited ((t nil)))
 `(linum ((t nil)))
 `(match ((t nil)))
 `(menu ((t nil)))
 `(minibuffer-prompt ((t nil)))
 `(mode-line-buffer-id ((t nil)))
 `(mode-line-emphasis ((t nil)))
 `(mode-line-highlight ((t nil)))
 `(mouse ((t nil)))
 `(next-error ((t nil)))
 `(nobreak-space ((t nil)))
 `(scroll-bar ((t nil)))
 `(shadow ((t nil)))
 `(show-paren-match ((t nil)))
 `(show-paren-mismatch ((t nil)))
 `(success ((t nil)))
 `(tool-bar ((t nil)))
 `(tooltip ((t nil)))
 `(tty-menu-disabled-face ((t nil)))
 `(tty-menu-enabled-face ((t nil)))
 `(tty-menu-selected-face ((t nil)))
 `(underline ((t nil)))
 `(undo-tree-visualizer-active-branch-face ((t nil)))
 `(undo-tree-visualizer-current-face ((t nil)))
 `(undo-tree-visualizer-default-face ((t nil)))
 `(undo-tree-visualizer-register-face ((t nil)))
 `(undo-tree-visualizer-unmodified-face ((t nil)))
 `(variable-pitch ((t nil)))
 `(warning ((t nil)))
 `(widget-button ((t nil)))
 `(widget-button-pressed ((t nil)))
 `(widget-documentation ((t nil)))
 `(widget-field ((t nil)))
 `(widget-inactive ((t nil)))
 `(widget-single-line-field ((t nil)))
 `(window-divider-first-pixel ((t nil)))
 `(window-divider-last-pixel ((t nil))))

(provide-theme 'bw-dark)
