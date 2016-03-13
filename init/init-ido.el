;; Use ido-mode

(use-package ido
  :init
  (setq ido-create-new-buffer 'always
        ido-enable-flex-matching t
        ido-everywhere t
        ido-use-filename-at-point 'guess
        ido-case-fold nil
        ido-use-faces nil)
  (ido-mode t)
  ;; (global-set-key
  ;;  "\M-x"
  ;;  (lambda ()
  ;;    (interactive)
  ;;    (call-interactively
  ;;     (intern
  ;;      (ido-completing-read
  ;;       "M-x "
  ;;       (all-completions "" obarray 'commandp))))))
  )

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
