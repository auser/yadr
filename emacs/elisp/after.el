
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

;; Buffers
(global-set-key (kbd "s-{") 'previous-buffer)
(global-set-key (kbd "s-}") 'next-buffer)
(global-set-key (kbd "s-<") 'beginning-of-buffer)
(global-set-key (kbd "s->") 'end-of-buffer)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; el-get
(require 'init-el-get)
(require 'init-c)
;; CommandT
(require 'init-command-t)
(require 'init-erlang)

(setq-default inhibit-startup-screen t)

;; Of course, don't uncomment the line below -- doing so would
;; stop Emacs from helpfully leaving "foo~" (backup) files all
;; over the place.
                                        ;(setq make-backup-files nil)

;; Use only spaces (no tabs at all).
(setq-default indent-tabs-mode nil)

;; Always show column numbers.
(setq-default column-number-mode t)

;; Display full pathname for files.
(add-hook 'find-file-hooks
          '(lambda ()
             (setq mode-line-buffer-identification 'buffer-file-truename)))

;; For easy window scrolling up and down.
(global-set-key "\M-n" 'scroll-up-line)
(global-set-key "\M-p" 'scroll-down-line)

