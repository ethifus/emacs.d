;; Speedbar configuration.

;; Local package - no ensure.
(use-package graphene-speedbar
  :config
  (speedbar-disable-update))

(use-package sr-speedbar
  :ensure t
  :bind
  ([f9] . sr-speedbar-toggle))

(use-package speedbar
  :init
  (require 'graphene-speedbar))


(provide 'init-filestree)
