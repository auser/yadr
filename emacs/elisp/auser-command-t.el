(defun find-dired-project (dir)
  (interactive "D")
  (find-dired dir "-no -path '*/.svn*' -not -path '*/.git*' -and -not -path '*.o' -and -type f"))

(global-set-key "\C-xd" 'find-dired-project)

(provide 'auser-command-t)