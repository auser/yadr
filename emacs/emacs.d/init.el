(add-to-list 'load-path "~/.emacs.d/packages/")
(add-to-list 'load-path "~/.elisp")

(require 'cl)

(setq user-emacs-directory "~/.emacs-live/")
(load-file "~/.emacs-live/init.el")
(setq user-emacs-directory "~/.emacs.d/")

;; Load the after file
(setq after-file "~/.elisp/after.el")
(load after-file 'noerror)