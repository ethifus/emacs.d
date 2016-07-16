(use-package google-translate
  :ensure t
  :bind
  (("C-c t" . google-translate-at-point)
   ("C-c T" . google-translate-query-translate))
  :init
  (require 'google-translate-default-ui)
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "pl"))


(provide 'init-translate)
