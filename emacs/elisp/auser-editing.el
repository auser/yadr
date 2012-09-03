;; Copy paste
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
  ;; optional key binding

(global-set-key "\C-c\C-k" 'copy-line)

(provide 'auser-editing)