(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")))

(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*")

(setq inferior-lisp-program "java -cp clojure-1.3.0.jar clojure.main")

(global-set-key
	(kbd "C-c C-j") 'clojure-jack-in)

(defun code-mode (x)
  (mapcar (lambda (hook) (add-hook hook x))
          '(ruby-mode
            clojure-mode-hook
            lisp-mode-hook
            slime-repl-mode-hook
            emacs-lisp-mode-hook)))

(autoload 'clojure-test-mode "clojure-test-mode" "Clojure test mode" t)
(autoload 'clojure-test-maybe-enable "clojure-test-mode" "" t)
(add-hook 'clojure-mode-hook 'clojure-test-maybe-enable)

(defun cljs ()
  (interactive)
  (setq inferior-lisp-program "cljs-browser-repl"))

(defun clojure () (interactive) (clojure-jack-in))
(defun restart-clojure () (interactive) (slime-quit-lisp) (kill-matching-buffers "slime-repl") (clojure-jack-in))

(defun no-catch-slime-compile-error ()
  "Redefine compile-file-for-emacs NOT to catch Throwable, so that the debugger is initiated
   for compile errors.  This makes compiler-notes fail to work, but I don't use those anyways."
  (slime-eval-async `(swank:eval-and-grab-output "(in-ns 'swank.commands.basic)(defn- compile-file-for-emacs*
  \"MONKEY PATCH\"
  ([file-name]
   (let [start (System/nanoTime)]
     (try
      (let [ret (clojure.core/load-file file-name)
                delta (- (System/nanoTime) start)]
        `(:compilation-result nil ~(pr-str ret) ~(/ delta 1000000000.0)))))))
(defslimefn compile-file-for-emacs
  ([file-name load? & compile-options]
   (when load?
     (compile-file-for-emacs* file-name))))")))

(add-hook 'slime-connected-hook 'no-catch-slime-compile-error)

(setq auto-mode-alist
      (cons '("\\.clj$" . clojure-mode)
            auto-mode-alist))

(set-language-environment "UTF-8")

(defmacro defclojureface (name color desc &optional others)
  `(defface ,name '((((class color)) (:foreground ,color ,@others))) ,desc :group 'faces))

(defclojureface clojure-parens       "DimGrey"   "Clojure parens")
(defclojureface clojure-braces       "#49b2c7"   "Clojure braces")
(defclojureface clojure-brackets     "SteelBlue" "Clojure brackets")
(defclojureface clojure-keyword      "khaki"     "Clojure keywords")
(defclojureface clojure-namespace    "#c476f1"   "Clojure namespace")
(defclojureface clojure-java-call    "#4bcf68"   "Clojure Java calls")
(defclojureface clojure-special      "#b8bb00"   "Clojure special")
(defclojureface clojure-double-quote "#b8bb00"   "Clojure special" (:background "unspecified"))

(defun tweak-clojure-syntax ()
  (mapcar (lambda (x) (font-lock-add-keywords nil x))
          '((("#?['`]*(\\|)"       . 'clojure-parens))
            (("#?\\^?{\\|}"        . 'clojure-brackets))
            (("\\[\\|\\]"          . 'clojure-braces))
            ((":\\w+"              . 'clojure-keyword))
            (("#?\""               0 'clojure-double-quote prepend))
            (("nil\\|true\\|false\\|%[1-9]?" . 'clojure-special))
            (("(\\(\\.[^ \n)]*\\|[^ \n)]+\\.\\|new\\)\\([ )\n]\\|$\\)" 1 'clojure-java-call))
            )))


;;; all code in this function lifted from the clojure-mode function
;;; from clojure-mode.el
;; https://gist.github.com/337280
(defun clojure-font-lock-setup ()
  (interactive)
  (set (make-local-variable 'lisp-indent-function)
       'clojure-indent-function)
  (set (make-local-variable 'lisp-doc-string-elt-property)
       'clojure-doc-string-elt)
  (set (make-local-variable 'font-lock-multiline) t)

  (add-to-list 'font-lock-extend-region-functions
               'clojure-font-lock-extend-region-def t)

  (when clojure-mode-font-lock-comment-sexp
    (add-to-list 'font-lock-extend-region-functions
                 'clojure-font-lock-extend-region-comment t)
    (make-local-variable 'clojure-font-lock-keywords)
    (add-to-list 'clojure-font-lock-keywords
                 'clojure-font-lock-mark-comment t)
    (set (make-local-variable 'open-paren-in-column-0-is-defun-start) nil))

  (setq font-lock-defaults
        '(clojure-font-lock-keywords    ; keywords
          nil nil
          (("+-*/.<>=!?$%_&~^:@" . "w")) ; syntax alist
          nil
          (font-lock-mark-block-function . mark-defun)
          (font-lock-syntactic-face-function
           . lisp-font-lock-syntactic-face-function))))

(add-hook 'slime-repl-mode-hook
          (lambda ()
            ;(font-lock-mode nil)
            (clojure-font-lock-setup)
            ;(font-lock-mode t)
            ))

(defadvice slime-repl-emit (after sr-emit-ad activate)
  (with-current-buffer (slime-output-buffer)
    (add-text-properties slime-output-start slime-output-end
                         '(font-lock-face slime-repl-output-face
                                          rear-nonsticky (font-lock-face)))))

(defadvice slime-repl-insert-prompt (after sr-prompt-ad activate)
  (with-current-buffer (slime-output-buffer)
    (let ((inhibit-read-only t))
      (add-text-properties slime-repl-prompt-start-mark (point-max)
                           '(font-lock-face slime-repl-prompt-face
                                            rear-nonsticky
                                            (slime-repl-prompt
                                             read-only
                                             font-lock-face
                                             intangible))))))

(provide 'auser-clojure)
