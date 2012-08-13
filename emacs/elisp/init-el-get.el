;;; bootstrap
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

(require 'package)
(add-to-list 'package-archives
            '("marmalade" . "http://marmalade-repo.org/packages/") t)


;;; load packages
(setq el-get-byte-compile t
      el-get-generate-autoloads t)

      (setq
       el-get-sources
       '((:name el-get)
         (:name package)
         ;; numbered windows for easy switching, takes over C-x o
         ;; elpa version has no autoloads, so use the el-get version
         (:name switch-window)
         ;; produce HTML with CSS-like selectors
         (:name zencoding-mode)
         ;; awesome html editing mode
         ; (:name nxhtml)
         ;; major mode for haml
         (:name haml-mode :type elpa)
         ;; major mode for markdown markup
         (:name markdown-mode :type elpa)
         ;; major mode for editing CMake config files
         (:name cmake-mode :type elpa)
         ;; Anything - candidate selection framework
         (:name anything
             :website "http://www.emacswiki.org/emacs/Anything"
             :description "Open anything / QuickSilver-like candidate-selection framework"
             :type elpa)
             
         (:name anything-config
          :website "http://www.emacswiki.org/emacs/Anything"
          :description "Handy configurations for Anything."
          :depends anything
          :type elpa)
         ;; exuberant ctags integration with Anything
         (:name anything-exuberant-ctags
          :website "https://github.com/k1LoW/anything-exuberant-ctags"
          :description "Exuberant ctags anything.el interface"
          :depends anything
          :load "anything-exuberant-ctags.el"
          :type elpa)
         ;; yasnippet
         (:name yasnippet
           :website "git://github.com/capitaomorte/yasnippet.git"
           :description "yasnippet is a template system for Emacs. It allows you to type an abbreviation and automatically expand it into function templates. Bundled language templates includes: C, C++, C#, Perl, Python, Ruby"
           :depends anything
           :after (progn
             (yas/global-mode t))
           :type github)
         ;; generic project mode
         (:name project-mode
          :website "http://code.google.com/p/emacs-project-mode/"
          :description "Emacs global minor mode for defining and navigating projects"
          :type svn
          :url "http://emacs-project-mode.googlecode.com/svn/trunk/"
          :features project-mode
          :depends levenshtein
          :after (progn
             (setq project-mode t)))
         ;; show flymake error icons at side
         ;; (:name flymake-fringe-icons)
         (:name buffer-move
          :type elpa
          :after (progn
             (package-initialize)
             (global-set-key (kbd "<C-S-up>")     'buf-move-up)
             (global-set-key (kbd "<C-S-down>")   'buf-move-down)
             (global-set-key (kbd "<C-S-left>")   'buf-move-left)
             (global-set-key (kbd "<C-S-right>")  'buf-move-right)))
         ;; a better (ido like) M-x
         (:name smex
          :type elpa
          :after (progn
             (package-initialize)
             (setq smex-save-file (concat user-emacs-directory ".smex-items"))
             (smex-initialize)
             (global-set-key (kbd "C-x C-m") 'execute-extended-command)
             (global-set-key [remap execute-extended-command] 'smex)
             (global-set-key (kbd "M-X") 'smex-major-mode-commands)))
         ;; move pointer back to last change
         (:name goto-last-change
          :type elpa
          :after (progn
             ;; when using AZERTY keyboard, consider C-x C-_
             (global-set-key (kbd "C-x C-/") 'goto-last-change)))
         ;; base for all color themes
         (:name color-theme
          :after (progn
             (global-set-key (kbd "C-c t") 'color-theme-select)))

         ;; This note is here to remind me of the issue with solarized.
         ;; Basically, it creates a border around the mode line in the bottom of the screen
         ;; This border pushes up the mode line and causes certain things (like less in terminal)
         ;; to cut off a line at the top since the bottom line isn't displayed completely.

         ;; dark and light Solarized color themes
         (:name color-theme-solarized
           :website "git://github.com/sellout/emacs-color-theme-solarized.git"
           :description "yasnippet is a template system for Emacs. It allows you to type an abbreviation and automatically expand it into function templates. Bundled language templates includes: C, C++, C#, Perl, Python, Ruby"
           :depends anything
           :type github
           :after (progn
             (load-theme 'solarized-dark t)))
             
         ; (:name enslime
         ;    :website "git://github.com/aemoncannon/ensime.git"
         ;    :description "the ENhanced Scala Interaction Mode for Emacs"
         ;    :type github
         ;    :post-init (add-hook 'scala-mode-hook 'ensime-scala-mode-hook))
              
         ;; can't use elpa with railscasts because it wants color-theme 6.6.1, and only 6.5.5 is available
         (:name color-theme-railscasts
          :after (progn
             (setq frame-background-mode 'dark)
             (color-theme-railscasts)))
         ;; use whole line when no region is present
         (:name whole-line-or-region
          :type elpa
          ;; :features whole-line-or-region
                :after (progn
             (package-initialize)
             (whole-line-or-region-mode t)))
         ;; automatically complete everything that comes in pairs, load auto-indent-mode first
         ;; autopair's author (same as yasnippet) does not really have released versions that aren't really old, just go for latest
         (:name autopair
             :after (progn
                (autopair-global-mode 1)))
         ;; the best auto-complete extension for emacs!
         (:name auto-complete
          :branch "1.3"
          :after (progn
               ;; (ac-set-trigger-key "TAB")
               ;; add to this list when more auto-completion is needed
               (setq ac-modes (append '(scss-mode) ac-modes))

               (defun auto-complete-custom ()
                 ;; re-assign `dabbrev' to this
                 (define-key ac-mode-map (kbd "M-/") 'auto-complete)
                 ;; add a tags auto-complete source when we have a tags file
                 ;; otherwise we get prompted for a tags file all the time, even when we don't have one
                 (when (or tags-file-name tags-table-list)
                   (add-to-list 'ac-sources 'ac-source-etags t)))

               (add-hook 'auto-complete-mode-hook 'auto-complete-custom)))
         ;; auto-complete source for tags
         (:name auto-complete-etags    
          :features auto-complete-etags
          :depends auto-complete)
         ;; yasnippet's author does not really provide releases or use tags,
         ;; and the version on Marmalade is quite old, so I've just put in the
         ;; most recent commit as of 2012-03-27. I wanted versions frozed so
         ;; things don't get broken.
         ; (:name yasnippet
         ;  :checkout "7e3ce48d3c12b8013b0837dc28c5b5ea40808272"
         ;  :after (progn
         ;     (yas/global-mode t)))
         ;; current commit as of 2012-03-27
         (:name auto-complete-clang
          :depends (auto-complete yasnippet)
          :features auto-complete-clang
          :checkout "d457ef42ad88148dd4e483d872b0ae483bb6f9f1"
          :after (progn
             (defun auto-complete-clang-custom ()
               (add-to-list 'ac-sources 'ac-source-clang)
               (define-key c-mode-base-map [remap auto-complete] 'ac-complete-clang))
             (add-hook 'c-mode-common-hook 'auto-complete-clang-custom)))
         ;; add smooth scrolling of buffers
         (:name smooth-scroll
          :type elpa)
         ;; undo history in a tree like vim, try C-x u
         (:name undo-tree
          :type elpa
          :after (progn
             (package-initialize)
             (global-undo-tree-mode t)))
         ;; textmate key emulation, try Command-T or Alt-T for goto file
         (:name textmate
          :type elpa
          :after (progn
             (package-initialize)
             (textmate-mode t)))
         ;; show the syntax error for the line under the cursor in the minibuffer
         (:name flymake-cursor
          :type elpa
          :after (progn
             (eval-after-load 'flymake '(require 'flymake-cursor))))
         ;; IMPORTANT : magit requires the `makeinfo' executable from the `texinfo' package to compile!!!
         ;; git meet emacs, and a binding
         (:name magit
         ;;    :build/darwin `(,(concat "make " (shell-quote-argument (concat "EMACS=" invocation-directory invocation-name)) " all"))
          :type elpa
                :after (progn
                         (global-set-key (kbd "C-x C-z") 'magit-status)))
         ;; (:name dtrt-indent      ; foreign indentation detection mode
         ;;     :post-init (progn))
          (:name ruby-mode      ; major mode for ruby
          :type elpa
           :depends autopair) ; try not to cause problems with turning off autopair-mode later, in case ruby mode hook is activated
         ;; (:name multi-term       ; better version of term
         ;;     :after (progn
         ;;        ;; don't mess with my terminal keys
         ;;        (setq term-bind-key-alist nil)
         ;;        (setq term-unbind-key-list nil)

         ;;        (setq multi-term-program "zsh") ; use zsh

         ;;        ;; name the terminal immediately - my first real Emacs Lisp function - woohoo!
         ;;                 (defun multi-term-with-name()
         ;;                   (interactive)
         ;;                   (multi-term)
         ;;                   (call-interactively 'rename-buffer)
         ;;          (rename-buffer (concat (buffer-name) "-term")))
         ;;        ;;; give it a shortcut
         ;;        (global-set-key (kbd "C-x t") 'multi-term-with-name)))
         (:name misc-cmds                ; Drew Adams' miscellaneous commands
          :type emacswiki
          :features misc-cmds
          :after (progn
             (substitute-key-definition 'move-beginning-of-line 'beginning-or-indentation global-map)
                         (substitute-key-definition 'move-end-of-line 'end-of-line+ global-map)))
        
        ; (:name sbt
        ;    :website "https://github.com/rubbish/sbt.el"
        ;    :description "support for running sbt in inferior mode."
        ;    :type github
        ;    :pkgname "rubbish/sbt.el"
        ;    :post-init (add-hook 'scala-mode-hook 'turn-on-sbt-mode))
           
         (:name fill-column-indicator
          :type elpa
          ;; this package has no autoloads, so the functions aren't loaded
          :after (progn
             (package-initialize)
             (require 'fill-column-indicator)
             ;; always use fci-mode
             (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
             (global-fci-mode 1)
             ))

         ;; Emacs Code Browser
         (:name ecb :type elpa)
         (:name yaml-mode :checkout "release-0.0.8")
          
      ))
      
(when (executable-find "svn")
  ;; subversion plugin for emacs
  (push '(:name psvn) el-get-sources))

(setq my:el-get-packages (loop for src in el-get-sources collect (el-get-source-name src)))

;; use a shallow clone for all git packages
(setq el-get-git-shallow-clone t)

;; install new packages and init already installed packages
(el-get 'sync my:el-get-packages)

(provide 'init-el-get)