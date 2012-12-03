;; PARENT MODE
(setq-default inhibit-startup-screen t)

;; Buffers
(global-set-key (kbd "s-{") 'previous-buffer)
(global-set-key (kbd "s-}") 'next-buffer)
(global-set-key (kbd "s-<") 'beginning-of-buffer)
(global-set-key (kbd "s->") 'end-of-buffer)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Hightlight code beetween {}
(require 'paren)
(setq show-paren-style 'expression)
(show-paren-mode 1)

;; custom font
(when (not (eq window-system nil))
  (progn 
    (set-frame-height (selected-frame) 60)
    (set-frame-width (selected-frame) 120)
    (set-face-attribute 'default nil :font "Menlo-12"))
  )
  
(provide 'auser-display)