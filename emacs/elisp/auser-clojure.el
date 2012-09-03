(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")))
            
(provide 'auser-clojure)