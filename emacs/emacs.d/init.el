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
                      clojure-mode clojure-test-mode ess
                      paredit color-theme solarized-theme
                      markdown-mode yaml-mode tuareg                                                                                      
                      marmalade oddmuse scpaste))

(dolist (p my-packages)
    (when (not (package-installed-p p))
          (package-install p)))

;; trying el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")  (unless (require 'el-get nil t) (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el" (lambda (s) (goto-char (point-max)) (eval-print-last-sexp))))


(setq-default inhibit-startup-screen t)
(autoload 'slime-selector "slime" t)

(require 'ess-site)

;; Of course, don't uncomment the line below -- doing so would
;; stop Emacs from helpfully leaving "foo~" (backup) files all
;; over the place.
;(setq make-backup-files nil)

;; to setup tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

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
(setq after-file "~/.elisp/after.el")
(load after-file 'noerror)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
