;; Enable Projectile globally.
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  ;; workaroud of projectile's slowing down emacs on remote fs
  (setq projectile-mode-line
        '(:eval (if (file-remote-p default-directory)
                    " P[]"
                  (format " P[%s]" (projectile-project-name)))))
  (setq projectile-completion-system 'ido))

;; Enable The Silver Searcher (to use with C-c p s s in Projectile).
(use-package ag
  :ensure t
  :config
  (setq ag-highlight-search t))


(provide 'init-projectile)
