(use-package python-mode
  :ensure t
  :defer t
  :mode "\\.py\\'"
  :interpreter ("python" . python-mode)
  :config
  (define-key python-mode-map (kbd "C->") 'python-indent-shift-right)
  (define-key python-mode-map (kbd "C-<") 'python-indent-shift-left)
  :init
  (add-hook
   'python-mode-hook
   (lambda ()
     (setq py-smart-indentation nil
           indent-tabs-mode nil)
     (auto-complete-mode nil)
     (auto-highlight-symbol-mode)))
  (add-hook 'python-mode-hook 'jedi:setup))

(use-package jedi
  :ensure t
  :defer t
  :init
  (setq jedi:setup-keys t
        jedi:complete-on-dot t))

;; Use company-mode instead of auto-complete with jedi.
(use-package company-jedi
  :ensure t
  :init
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-jedi)))

(use-package elpy
  :ensure t
  :defer t
  :bind (:map elpy-mode-map
              ("M-." . elpy-goto-definition)
              ("M-," . pop-tag-mark))
  :config
  (setq elpy-rpc-backend "jedi")
  (elpy-enable))

;; Hihghlight symbol under cursor.
(use-package auto-highlight-symbol
  :ensure t
  :diminish highlight-mode
  :defer t)


(provide 'init-python)
