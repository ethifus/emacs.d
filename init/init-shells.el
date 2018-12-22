;; Shells configuration.

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; eshell local package.
(use-package eshell
  :hook (eshell-mode-hook . (lambda ()
                              (local-set-key (kbd "<up>") (previous-line))
                              (local-set-key (kbd "<down>") (next-line))))
  :config
  (require 'em-smart)
  (setq eshell-where-to-jump 'begin
        eshell-review-quick-commands nil
        eshell-smart-space-goes-to-end t))


(provide 'init-shells)
