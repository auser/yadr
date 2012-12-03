
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(require 'ensime)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(provide 'auser-scala)
