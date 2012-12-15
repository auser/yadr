;;; bootstrap
; (setq auser:el-get-packages (loop for src in el-get-sources
;                                   collect (el-get-source-name src)))
;starter-kit starter-kit-lisp starter-kit-eshell
;                       starter-kit-bindings scpaste
;                       clojure-mode clojure-test-mode ess
;                       paredit
;                       markdown-mode yaml-mode tuareg
;                       marmalade oddmuse scpaste

(setq el-get-dir (concat (file-name-directory load-file-name) "el-get") )

(add-to-list 'load-path (concat el-get-dir "/el-get"))

(print (concat el-get-dir "/el-get"))

(unless (require 'el-get nil t)
	(url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el" (lambda (s) (goto-char (point-max)) (eval-print-last-sexp))))

(setq el-get-sources
      '(
        (:name buffer-move      ; have to add your own keys
          :after (progn ()
            (global-set-key (kbd "<C-S-up>")     'buf-move-up)
            (global-set-key (kbd "<C-S-down>")   'buf-move-down)
            (global-set-key (kbd "<C-S-left>")   'buf-move-left)
            (global-set-key (kbd "<C-S-right>")  'buf-move-right)))
        (:name el-get)
        (:name package)
        ;;
;;        (:name ecb)
        (:name nav
               :description "Emacs mode for filesystem navigation"
               :type git
               :url "git://github.com/macsf/emacs-nav.git"
               :features nav)
        (:name icomplete+)
        ; (:name cedet)
        (:name eproject)
        (:name paredit)
        (:name sr-speedbar)
        ;; numbered windows for easy switching, takes over C-x o
        ;; elpa version has no autoloads, so use the el-get version
        (:name switch-window)
        ;; awesome html editing mode
        ; (:name nxhtml)
        ;; major mode for haml
        (:name haml-mode)
        ; nrepl
        (:name nrepl)
        ;; major mode for markdown markup
        (:name markdown-mode)
        ;; YAML
        (:name yaml-mode)
        ;; nrepl
        ; (:name nrepl)
        ;; tuareg-mode
        (:name tuareg-mode)
        ;; oddmuse
        (:name oddmuse)
        ;; major mode for clojure
        (:name clojure-mode)
        ;; scala
        (:name scala-mode)
        ;; ensime
        (:name ensime
               :description "ENhanced Scala Interaction Mode for Emacs"
               :type github
               :pkgname "aemoncannon/ensime"
               :build ("sbt stage")
               :depends scala-mode
               :features ensime
               :load-path ("./dist_2.9.2/elisp") ;; src/main
               :post-init (progn
                            (require 'ensime)
                                                ;; scala-mode can be
                            ;; found in the scala distribution:
                            (require 'scala-mode-auto)
                                                (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)))
        ;; major mode for editing CMake config files
        (:name cmake-mode)
        ;; Multiterm
        (:name multi-term)
        ; ;; Anything - candidate selection framework
        (:name anything)
        ; ;; yasnippet
        (:name "yasnippet"
               :description "YASnippet is a template system for Emacs."
               :type git
               :url "https://github.com/capitaomorte/yasnippet")
        ; ;; a better (ido like) M-x
        (:name smex)
        ;
        (:name ac-slime)
        ; (:name vimpulse)
        (:name color-theme-solarized)
        ; (:name ensime :url "https://github.com/auser/ensime.git")
        (:name elein)
        (:name autopair
           :after (progn
              (autopair-global-mode 1)))
        ; ;; add smooth scrolling of buffers
        (:name smooth-scroll)
        ; ;; undo history in a tree like vim, try C-x u
        ;;(:name undo-tree)
        (:name lusty-explorer)
        (:name flymake-ruby)
        (:name dired+)
        (:name coffee-mode)
      ))

(defun sync-packages ()
  "Synchronize packages"
  (interactive)
  ;; use a shallow clone for all git packages
  (setq el-get-git-shallow-clone t)

  (el-get 'sync '(el-get package))
  (add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  ;; define my packages
  (setq my-packages (mapcar 'el-get-source-name el-get-sources))
  (el-get 'sync my-packages))

(unless (require 'el-get nil 'noerror)
	(with-current-buffer
			(url-retrieve-synchronously
			 "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
		(goto-char (point-max))
		(eval-print-last-sexp)))

(sync-packages)
(provide 'auser-el-get)
