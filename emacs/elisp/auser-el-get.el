;;; bootstrap
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
; (setq auser:el-get-packages (loop for src in el-get-sources
;                                   collect (el-get-source-name src)))
(setq el-get-sources
      '(
        (:name buffer-move      ; have to add your own keys
          :after (lambda ()
            (global-set-key (kbd "<C-S-up>")     'buf-move-up)
            (global-set-key (kbd "<C-S-down>")   'buf-move-down)
            (global-set-key (kbd "<C-S-left>")   'buf-move-left)
            (global-set-key (kbd "<C-S-right>")  'buf-move-right)))
        (:name el-get)
        (:name package)
        ;; numbered windows for easy switching, takes over C-x o
        ;; elpa version has no autoloads, so use the el-get version
        (:name switch-window)
        ;; awesome html editing mode
        ; (:name nxhtml)
        ;; major mode for haml
        (:name haml-mode)
        ;; major mode for markdown markup
        (:name markdown-mode)
        ;; major mode for clojure
        (:name clojure-mode)
        ;; scala
        (:name scala-mode)
        ;; major mode for editing CMake config files
        (:name cmake-mode)
        ; ;; Anything - candidate selection framework
        (:name anything)
        ; ;; yasnippet
        ; (:name yasnippet)
        ; ;; a better (ido like) M-x
        (:name smex)
        (:name vimpulse)
        (:name color-theme-solarized)
        ; (:name ensime :url "https://github.com/auser/ensime.git")
        (:name elein)
        (:name autopair
           :after (progn
              (autopair-global-mode 1)))
        ; ;; add smooth scrolling of buffers
        (:name smooth-scroll)
        ; ;; undo history in a tree like vim, try C-x u
        (:name undo-tree)
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

(if (require 'el-get nil t)
    (sync-packages)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (end-of-buffer)
       (eval-print-last-sexp)
       (setq el-get-verbose t)
       (sync-packages)))))


(provide 'auser-el-get)
