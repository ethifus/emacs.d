;; Use ido-mode.

(use-package ido
  :ensure t
  :init
  (setq ido-create-new-buffer 'always
        ido-enable-flex-matching t
        ido-everywhere t
        ido-use-filename-at-point 'guess
        ido-case-fold nil
        ido-use-faces nil
        ido-default-buffer-method 'selected-window)
  (ido-mode t)
  (global-set-key (kbd "C-;") 'ido-switch-buffer))

;; Fuzzy matching for ido.
(use-package flx-ido
  :ensure t
  :init
  (flx-ido-mode t))

;; Show recently and mostly used commands on M-x.
(use-package smex
  :ensure t
  :bind
  (("M-x" . smex))
  :config
  (smex-initialize))

;; Present ido search results as a grid.
(use-package ido-grid-mode
  :ensure t
  :init
  (setq ido-grid-mode-min-rows 1
        ido-grid-mode-max-rows 15
        ido-grid-mode-prefix-scrolls t)
  (ido-grid-mode t))

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode 1))

(provide 'init-ido)
