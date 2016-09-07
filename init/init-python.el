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
     (setq py-smart-indentation nil)
     (setq indent-tabs-mode nil)
     (auto-complete-mode t)
     (auto-highlight-symbol-mode)))
  (add-hook 'python-mode-hook 'jedi:setup))

(use-package jedi
  :ensure t
  :defer t
  :init
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t))

(use-package elpy
  :ensure t
  :defer t
  :init
  (elpy-enable))

(use-package auto-highlight-symbol
  :ensure t
  :defer t)


(provide 'init-python)
