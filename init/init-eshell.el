;; eshell local package.
(use-package eshell
  :config
  (require 'em-smart)
  (setq eshell-where-to-jump 'begin
        eshell-review-quick-commands nil
        eshell-smart-space-goes-to-end t)
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  (add-hook 'eshell-mode-hook
          (lambda ()
            (local-set-key (kbd "<up>") (previous-line))
            (local-set-key (kbd "<down>") (next-line)))))


(provide 'init-eshell)
