;; Add local paths to PATH enviroment.
(setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "~/.local/bin")))

;; Add local binary locations.
(setq exec-path (append exec-path (list (expand-file-name "~/.local/bin"))))

;; Add path to custom modules and init scripts.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


(provide 'init-paths)
