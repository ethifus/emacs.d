;; requirements: node.js, npm, typescript

(use-package company
  :ensure t)

(defun setup-tide-mode ()
  (tide-setup)
  (flycheck-mode 1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode 1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode 1))

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

(use-package js2-mode
   :ensure t
   :mode "\\.js\\'"
   :config
   (add-to-list 'interpreter-mode-alist '("node" . js2-mode)))

(use-package typescript-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :mode ("\\.phtml\\'"
         "\\.tpl\\.php\\'"
         "\\.jsp\\'"
         "\\.as[cp]x\\'"
         "\\.erb\\'"
         "\\.mustache\\'"
         "\\.djhtml\\'"
         "\\.html?\\'"
         "\\.tsx\\'")
  :config
  (when (package-install-p 'tide)
    (add-hook 'web-mode-hook
              (lambda ()
                (when (string-equals "tsx" (file-name-extension buffer-file-name))
                  (setup-tide-mode))))))


(provide 'init-web)
