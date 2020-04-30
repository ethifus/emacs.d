(require 'cl)

(defun eth/init-paths (paths)
  "Add paths to PATH environment and to binary locations in
`exec-path'."
  (let ((paths (mapcar 'expand-file-name paths)))
    (setenv "PATH"
            (mapconcat #'identity
                       (remove-duplicates (split-string (getenv "PATH") ":") :test 'string=) ":"))
    (setq exec-path (remove-duplicates (append exec-path paths) :test 'string=))))

(eth/init-paths (list "~/.local/bin"))
(eth/init-paths (list "/usr/local/bin"))


;; Add path to custom modules and init scripts.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


(provide 'init-paths)
