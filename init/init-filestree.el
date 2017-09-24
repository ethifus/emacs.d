;; Speedbar configuration.

;; (use-package sr-speedbar
;;   :ensure t
;;   :bind
;;   ([f9] . sr-speedbar-toggle))

;; Local package - no ensure.
;; (use-package graphene-speedbar
;;   :config
;;   (speedbar-disable-update))

;; Local package
;; (use-package speedbar
;;   :config
;;   (require 'graphene-speedbar))

;; (use-package projectile-speedbar
;;   :ensure t
;;   :init
;;   (setq projectile-speedbar-enable nil))

(use-package treemacs
  :ensure t
  :config
  (progn
    (setq treemacs-follow-after-init          t
          treemacs-width                      35
          treemacs-indentation                2
          treemacs-git-integration            t
          treemacs-collapse-dirs              3
          treemacs-silent-refresh             nil
          treemacs-change-root-without-asking nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-show-hidden-files          t
          treemacs-never-persist              nil
          treemacs-is-never-other-window      nil
          treemacs-goto-tag-strategy          'refetch-index)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t))
  :bind
  (:map global-map ([f9] . treemacs-toggle)))

(use-package treemacs-projectile
  :ensure t
  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header))

(provide 'init-filestree)
