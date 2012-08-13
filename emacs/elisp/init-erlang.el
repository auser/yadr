;; see http://bc.tech.coop/blog/070528.html
(add-to-list 'load-path "~/src/main/elisp/")
(require 'distel)
(distel-setup)

(defun dss/erlang-mode-hook ()
  (interactive)
  (linum-mode))

(add-hook 'erlang-mode-hook 'dss/erlang-mode-hook)
(provide 'dss-erlang)