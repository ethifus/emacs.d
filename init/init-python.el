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
     (set1 indent-tabs-mode nil)
     (auto-complete-mode t)))
  (add-hook 'python-mode-hook 'jedi:setup))

(use-package jedi
  :ensure t
  :defer t
  :init
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t))
