;; Golang

;; Setup environment variables.
(setenv "GOPATH" (expand-file-name "~/work/go"))

(setenv "PATH" (concat (getenv "PATH") ":"
                       (expand-file-name "~/work/go/bin")))

(setq exec-path (append exec-path
                        (list (expand-file-name "~/work/go/bin"))))

(use-package go-eldoc
  :ensure t)

(use-package flymake-go
  :ensure t)

(use-package go-mode
  :ensure t
  :bind (:map go-mode-map
              ("M-." . godef-jump))
  :config
  ;;(require 'go-autocomplete)
  ;;(require 'auto-complete-config)
  (setq gofmt-command "goimports")

  (require 'go-eldoc)

  (defun my-go-mode-hook ()
    (add-hook 'before-save-hook 'gofmt-before-save))

  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (add-hook 'go-mode-hook 'my-go-mode-hook)

  (eval-after-load "go-mode"
    '(require 'flymake-go)))


(provide 'init-golang)
