;; Filetree configuration.

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
  :bind (:map treemacs-mode-map
              ("<mouse-1>" . treemacs-single-click-expand-action)
              ("<next>" . scroll-up-command)
              ("<prior>" . scroll-down-command))
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
          treemacs-is-never-other-window      nil
          treemacs-goto-tag-strategy          'refetch-index
          treemacs-silent-filewatch           t
          treemacs-display-in-side-window     t
          treemacs-silent-refresh             t
          treemacs-recenter-after-file-follow t
          treemacs-space-between-root-nodes   nil)
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)))

(use-package treemacs-projectile
  ;; :after treemacs projectile
  :ensure t
  :bind (("<f9>" . treemacs-projectile)))

(provide 'init-filestree)
