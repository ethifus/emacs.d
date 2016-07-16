;; enable Projectile globally
(use-package projectile
  :defer t
  :config
  ;; workaroud of projectile's slowing down emacs on remote fs
  (projectile-global-mode)
  (setq projectile-mode-line " Projectile"))

(use-package projectile-speedbar
  :defer t
  :ensure t)


(provide 'init-projectile)
