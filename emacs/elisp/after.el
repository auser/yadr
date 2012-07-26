
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
;;(require 'color-theme)
;;(load-theme 'solarized-dark t)

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
    "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
    (lambda (s)
      (end-of-buffer)
      (eval-print-last-sexp))))

(el-get 'sync)

;; CommandT
(defun find-dired-project (dir)
  (interactive "D")
  (find-dired dir "-no -path '*/.svn*' -not -path '*/.git*' -and -not -path '*.o' -and -type f"))

(global-set-key "\C-xd" 'find-dired-project)

;; Compilation
(defun my-save-and-compile ()
  "Save current buffer and issue compile."
  (interactive "")
  (save-buffer 0)
  (compile (concat "make -j2 -k -C " make-root)))

(defun my-c-mode-hook ()
;; (c-toggle-auto-state 1)
 
  (c-toggle-hungry-state 1)
  (my-indent-setup)
  ;; keys
  ;; (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)
  ;; (local-set-key (kbd "<C-tab>") 'sourcepair-load)
  (local-set-key "\C-c\C-c" 'my-save-and-compile)

  ;; (local-set-key (kbd "<M-return>") 'semantic-ia-complete-symbol)
  ;; (local-set-key (kbd "<C-return>") 'senator-complete-symbol)

  ;; (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  ;; (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  ;; (local-set-key "\C-cs" 'semantic-symref)
  ;; (local-set-key "\C-c." 'semantic-ia-fast-jump)
  ;; (local-set-key "\C-cd" 'semantic-ia-show-doc)

  ;; (local-set-key "\M-A" 'senator-previous-tag)
  ;; (local-set-key "\M-E" 'senator-next-tag)
  ;; (c-set-offset 'innamespace 0)
;; (indent-file-when-save)
;; (indent-file-when-visit)
)

(add-hook 'c-mode-common-hook 'my-c-mode-hook)

