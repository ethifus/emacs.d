;; enable Projectile globally
(use-package projectile
  :defer t
  :config
  (projectile-global-mode)
  ;; workaroud of projectile's slowing down emacs on remote fs
  (setq projectile-mode-line
        '(:eval (if (file-remote-p default-directory)
                    " Proj"
                  (format " Proj[%s]" (projectile-project-name))))))


(use-package projectile-speedbar
  :defer t
  :ensure t)


(provide 'init-projectile)
