

(defun my-clear ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
        (comint-truncate-buffer)))
