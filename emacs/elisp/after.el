;; el-get

(setq this-dir (file-name-directory load-file-name))
;(add-to-list 'load-path (concat (file-name-as-directory "auser"))
(add-to-list 'load-path (concat this-dir "auser"))

(require 'auser-el-get)
(require 'auser-helpers)

(require 'auser-foundation)

;; Display
(require 'auser-display)
(require 'auser-shell)
(require 'auser-c)
;; CommandT
(require 'auser-command-t)
(require 'auser-erlang)
(require 'auser-scala)
(require 'auser-clojure)

;; Of course, don't uncomment the line below -- doing so would
;; stop Emacs from helpfully leaving "foo~" (backup) files all
;; over the place.
                                        ;(setq make-backup-files nil)

;; THEME
(load-theme 'solarized-dark t)

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



;; overrride the normal file-opening, buffer switching
(global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
(global-set-key (kbd "C-x b")   'lusty-buffer-explorer)

(nav)