(setq make-root "")

(add-to-list 'load-path "~/.emacs.d/packages/")
(add-to-list 'load-path "~/.elisp")

(require 'cl)

; marmalade
(require 'package) 
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) (package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell
                      starter-kit-bindings scpaste
                      clojure-mode clojure-test-mode
                      paredit color-theme solarized-theme
                      markdown-mode yaml-mode tuareg                                                                                                                                  
                      marmalade oddmuse scpaste))

(dolist (p my-packages)
    (when (not (package-installed-p p))
          (package-install p)))

(setq-default inhibit-startup-screen t)
(autoload 'slime-selector "slime" t)

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

;; Load the after file
(setq after-file "~/.emacs.d/after.el")
(load after-file 'noerror)
