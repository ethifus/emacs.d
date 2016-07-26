;; Use ido-mode

(use-package ido
  :ensure t
  :init
  (setq ido-create-new-buffer 'always
        ido-enable-flex-matching t
        ido-everywhere t
        ido-use-filename-at-point 'guess
        ido-case-fold nil
        ido-use-faces nil)
  (ido-mode t))

;; Fuzzy matching for ido
(use-package flx-ido
  :ensure t
  :init
  (flx-ido-mode t))

;; Show recently and mostly used commands on M-x
(use-package smex
  :ensure t
  :bind
  (("M-x" . smex))
  :config
  (smex-initialize))


(provide 'init-ido)
