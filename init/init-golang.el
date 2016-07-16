;; Golang

;; Setup environment variables
(setenv "GOPATH" (expand-file-name "~/work/go"))

(setenv "PATH" (concat (getenv "PATH") ":"
                       (expand-file-name "~/work/go/bin")))

(setq exec-path (append exec-path
                        (list (expand-file-name "~/work/go/bin"))))

;; (use-package go-autocomplete
;;   :ensure t)

(use-package go-eldoc
  :ensure t)

(use-package flymake
  :ensure t)

(use-package flymake-go
  :ensure t)

(use-package go-mode
  :ensure t
  :config
  ;;(require 'go-autocomplete)
  ;;(require 'auto-complete-config)
  (setq gofmt-command "goimports")
  
  (require 'go-eldoc)

  (add-hook 'go-mode-hook 'go-eldoc-setup)

  (defun my-go-mode-hook ()
    (add-hook 'before-save-hook 'gofmt-before-save)
    (local-set-key (kbd "M-.") 'godef-jump))

  (add-hook 'go-mode-hook 'my-go-mode-hook)
  (eval-after-load "go-mode"
    '(require 'flymake-go)))

;(load "$GOPATH/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")
;(add-hook 'go-mode-hook 'go-oracle-mode)


(provide 'init-golang)
