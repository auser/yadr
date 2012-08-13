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
(provide 'init-c)