;; Golang
(setenv "GOROOT" (expand-file-name "~/.local/go"))
(setenv "GOPATH" (expand-file-name "~/work/go"))

(setq gofmt-command "goimports")

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
