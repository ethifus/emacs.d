;; Speedbar configuration.

;; Local package - no ensure.
(use-package graphene-speedbar
  :defer t
  :config
  (speedbar-disable-update))

(use-package sr-speedbar
  :defer t
  :ensure t
  :bind
  ([f9] . sr-speedbar-toggle))

(use-package speedbar
  :defer t
  :init
  (require 'graphene-speedbar))


(provide 'init-filestree)
