;; neotree and speedbar configuration

;; local package - no ensure
(use-package graphene-speedbar
  :defer t
  :config
  (speedbar-disable-update))

(use-package sr-speedbar
  :defer t
  :ensure t
  :bind
  ([f9] . sr-speedbar-toggle))

;; buildin package
(use-package speedbar
  :defer t
  :init
  (require 'graphene-speedbar)
  (require 'projectile-speedbar nil t))


(provide 'init-filestree)
