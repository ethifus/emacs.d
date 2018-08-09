;; Enable Projectile globally.
(use-package projectile
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (projectile-mode t)
  ;; workaroud of projectile's slowing down emacs on remote fs
  (setq projectile-mode-line
        '(:eval (format " P[%s]" (projectile-project-name)))
        projectile-completion-system 'ido
        projectile-project-search-path '("~/repo/")))

;; Enable The Silver Searcher (to use with C-c p s s in Projectile).
(use-package ag
  :ensure t
  :config
  (setq ag-highlight-search t))


(provide 'init-projectile)
