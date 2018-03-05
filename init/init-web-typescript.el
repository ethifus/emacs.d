;; Requirements: typescript.

(defun setup-tide-mode ()
  (tide-setup)
  (flycheck-mode 1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode 1)
  (tide-hl-identifier 1)
  (company-mode 1)
  (auto-highlight-symbol-mode t)
  (electric-indent-local-mode t))

;; TypeScript Interactive Development Environment for Emacs.
(use-package tide
  :ensure t
  :init
  (add-hook 'typescript-mode-hook 'setup-tide-mode)
  (add-hook 'js2-mode-hook 'setup-tide-mode)
  :config
  ;; format options
  (setq tide-format-options
        '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t
          :placeOpenBraceOnNewLineForFunctions nil))
  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t))


(use-package typescript-mode
  :ensure t)


(provide 'init-web-typescript)
