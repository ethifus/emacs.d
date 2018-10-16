;; Requirements: typescript.

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode 1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode 1)
  (tide-hl-identifier-mode 1)
  (company-mode 1)
  ;; (auto-highlight-symbol-mode t)
  (electric-indent-local-mode t))

;; TypeScript Interactive Development Environment for Emacs.
(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  ;; :hook ((typescript-mode js2-mode) . setup-tide-mode)
  :hook ((typescript-mode . setup-tide-mode)
         (before-save . tide-format-before-save))
  :config
  ;; format options
  (setq tide-format-options
        '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t
          :placeOpenBraceOnNewLineForFunctions nil))
  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t))


(use-package typescript-mode
  :ensure t)


(provide 'init-web-typescript)
