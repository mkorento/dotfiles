(deftheme bw-dark
  "Created 2018-06-02.")

(custom-theme-set-variables
 'bw-dark
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"]))

(custom-theme-set-faces
 'bw-dark
 '(cursor ((t (:background "#aaaaaa"))))
 '(region ((t (:background "#000000" :foreground "#586E75"))))
 '(secondary-selection ((((class color) (min-colors 89)) (:background "#333366" :foreground "#f6f3e8"))))
 '(isearch ((t (:background "#839496" :foreground "#002B36"))))
 '(lazy-highlight ((t (:background "#586E75" :foreground "#002B36"))))
 '(mode-line ((t (:background "#586E75" :foreground "#002B36"))))
 '(mode-line-inactive ((t (:background "#002B36" :foreground "#002B36"))))
 '(font-lock-comment-face ((t (:foreground "#586E75"))))
 '(font-lock-string-face ((t (:foreground "#586E75"))))
 '(avy-lead-face ((t (:foreground "#DC322F" :background "#002B36"))))
 '(avy-lead-face-0 ((t (:foreground "#DC322F" :background "#002B36"))))
 '(avy-lead-face-1 ((t (:foreground "#DC322F" :background "#002B36"))))
 '(avy-lead-face-2 ((t (:foreground "#DC322F" :background "#002B36"))))
 '(whitespace-line ((t (:background "#002B36" :foreground "#DC322F"))))
 '(fringe ((t (:background "#002B36" :foreground "#839496"))))
 '(window-divider ((t (:background "#002B36" :foreground "#839496"))))
 '(avy-background-face ((t (:foreground "#002B36"))))
 '(border ((t (:background "#586E75" :foreground "#002B36"))))
 '(vertical-border ((t (:background "#586E75" :foreground "#002B36"))))
 '(trailing-whitespace ((t (:foreground "#DC322F" :underline t))))
 '(header-line ((t (:inherit default :inverse-video nil :underline t))))
 '(query-replace ((t (:inherit (isearch)))))
 '(Info-quoted ((t (:inherit fixed-pitch-serif :foreground "#839496"))))
 '(completions-annotations ((t nil)))
 '(button ((t nil)))
 '(custom-button ((t nil)))
 '(custom-button-mouse ((t nil)))
 '(custom-button-pressed ((t nil)))
 '(custom-button-pressed-unraised ((t nil)))
 '(custom-button-unraised ((t nil)))
 '(custom-changed ((t nil)))
 '(custom-comment ((t nil)))
 '(custom-comment-tag ((t nil)))
 '(custom-documentation ((t nil)))
 '(custom-face-tag ((t nil)))
 '(custom-group-subtitle ((t nil)))
 '(custom-group-tag ((t nil)))
 '(custom-group-tag-1 ((t nil)))
 '(custom-invalid ((t nil)))
 '(custom-link ((t nil)))
 '(custom-modified ((t nil)))
 '(custom-rogue ((t nil)))
 '(custom-saved ((t nil)))
 '(custom-set ((t nil)))
 '(custom-state ((t nil)))
 '(custom-themed ((t nil)))
 '(custom-variable-button ((t nil)))
 '(custom-variable-tag ((t nil)))
 '(custom-visibility ((t nil)))
 '(error ((t (:background "orange red" :foreground "orange"))))
 '(escape-glyph ((t nil)))
 '(file-name-shadow ((t nil)))
 '(font-lock-builtin-face ((t nil)))
 '(font-lock-constant-face ((t nil)))
 '(font-lock-doc-face ((t nil)))
 '(font-lock-function-name-face ((t nil)))
 '(font-lock-keyword-face ((t nil)))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t nil)))
 '(font-lock-regexp-grouping-backslash ((t nil)))
 '(font-lock-regexp-grouping-construct ((t nil)))
 '(font-lock-type-face ((t nil)))
 '(font-lock-variable-name-face ((t nil)))
 '(font-lock-warning-face ((t nil)))
 '(glyphless-char ((t nil)))
 '(help-argument-name ((t nil)))
 '(highlight ((t nil)))
 '(info-index-match ((t nil)))
 '(info-menu-header ((t nil)))
 '(info-menu-star ((t nil)))
 '(info-title-1 ((t nil)))
 '(info-title-2 ((t nil)))
 '(info-title-3 ((t nil)))
 '(info-title-4 ((t nil)))
 '(isearch-fail ((t nil)))
 '(italic ((t nil)))
 '(linum ((t nil)))
 '(match ((t nil)))
 '(menu ((t nil)))
 '(mode-line-buffer-id ((t nil)))
 '(minibuffer-prompt ((t (:foreground "#586E75"))))
 '(mode-line-emphasis ((t nil)))
 '(mode-line-highlight ((t nil)))
 '(mouse ((t nil)))
 '(next-error ((t nil)))
 '(nobreak-space ((t nil)))
 '(scroll-bar ((t nil)))
 '(shadow ((t nil)))
 '(show-paren-match ((t (:background "#586E75" :foreground "red1"))))
 '(show-paren-mismatch ((t nil)))
 '(success ((t (:background "forest green" :foreground "pale green"))))
 '(tool-bar ((t nil)))
 '(tooltip ((t nil)))
 '(tty-menu-disabled-face ((t nil)))
 '(tty-menu-enabled-face ((t nil)))
 '(tty-menu-selected-face ((t nil)))
 '(underline ((t (:underline t))))
 '(undo-tree-visualizer-active-branch-face ((t nil)))
 '(undo-tree-visualizer-current-face ((t nil)))
 '(undo-tree-visualizer-default-face ((t nil)))
 '(undo-tree-visualizer-register-face ((t nil)))
 '(undo-tree-visualizer-unmodified-face ((t nil)))
 '(variable-pitch ((t nil)))
 '(warning ((t (:foreground "orange red"))))
 '(widget-button ((t nil)))
 '(widget-button-pressed ((t nil)))
 '(widget-documentation ((t nil)))
 '(widget-field ((t nil)))
 '(widget-inactive ((t nil)))
 '(widget-single-line-field ((t nil)))
 '(window-divider-first-pixel ((t nil)))
 '(window-divider-last-pixel ((t nil)))
 '(link ((t (:foreground "#2688D2" :underline t))))
 '(link-visited ((t (:inherit link :foreground "magenta4"))))
 '(default ((t (:background "#002B36" :foreground "#839496")))))

(provide-theme 'bw-dark)
