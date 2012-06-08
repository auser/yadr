
;; THEME

;; PARENT MODE
;; Hightlight code beetween {}
(require 'paren)
(setq show-paren-style 'expression)
(show-paren-mode 1)

;; Copy paste
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
  ;; optional key binding

(global-set-key "\C-c\C-k" 'copy-line)


;; custom font
(when (not (eq window-system nil))
  (progn 
    (set-frame-height (selected-frame) 60)
    (set-frame-width (selected-frame) 120)
    (set-face-attribute 'default nil :font "Menlo-12"))
  )

(set-default-font "Menlo-12")

;; Buffers
(global-set-key (kbd "s-{") 'previous-buffer)
(global-set-key (kbd "s-}") 'next-buffer)
(global-set-key (kbd "s-<") 'beginning-of-buffer)
(global-set-key (kbd "s->") 'end-of-buffer)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Set the theme
(load-theme 'solarized-dark t)
