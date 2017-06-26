;; Speedbar configuration.

(use-package sr-speedbar
  :ensure t
  :bind
  ([f9] . sr-speedbar-toggle))

;; Local package - no ensure.
(use-package graphene-speedbar
  :config
  (speedbar-disable-update))

;; Local package
(use-package speedbar
  :config
  (require 'graphene-speedbar))

(use-package projectile-speedbar
  :ensure t
  :init
  (setq projectile-speedbar-enable nil))



(provide 'init-filestree)
