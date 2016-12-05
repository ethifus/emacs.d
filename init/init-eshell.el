;; eshell local package.
(use-package eshell
  :config
  (require 'em-smart)
  (setq eshell-where-to-jump 'begin
        eshell-review-quick-commands nil
        eshell-smart-space-goes-to-end t)
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on))


(provide 'init-eshell)
