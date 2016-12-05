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


(provide 'init-filestree)
