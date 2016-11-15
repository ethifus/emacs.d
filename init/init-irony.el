;; Irony mode for C/C++.

;; Set default C formatting style.
(setq-default c-default-style "stroustrup")

(use-package irony
  :ensure t
  :config
  (progn
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'objc-mode-hook 'irony-mode)))

(use-package company-irony
  :ensure t
  :init
  (progn
    (eval-after-load 'company
      '(add-to-list 'company-backends 'company-irony))))


(provide 'init-irony)
