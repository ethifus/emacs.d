(use-package google-translate
  :ensure t
  :init
  (require 'google-translate-default-ui)
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "pl")
  (global-set-key (kbd "C-c t") 'google-translate-at-point)
  (global-set-key (kbd "C-c T") 'google-translate-query-translate))
