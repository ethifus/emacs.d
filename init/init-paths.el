(defun eth/init-paths (paths)
  "Add paths to PATH environment and to binary locations in
`exec-path'."
  (let ((paths (mapcar 'expand-file-name paths)))
    (setenv "PATH"
            (apply 'concat
                   (append (list (getenv "PATH"))
                           (mapcar (lambda (element) (concat ":" element)) paths))))
    (setq exec-path (append exec-path paths))))

(eth/init-paths (list "~/.local/bin" "~/.local/lib/node_modules/bin"))


;; Add path to custom modules and init scripts.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


(provide 'init-paths)
