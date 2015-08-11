;; Use ido-mode
(require 'ido)
(use-package flx-ido
  :ensure t
  :init
  (ido-mode t)
  (flx-ido-mode t)
  (setq ido-create-new-buffer 'always
        ido-enable-flex-matching t
        ido-everywhere t
        ido-use-filename-at-point nil
        ido-case-fold nil
        ido-use-faces nil)
  (global-set-key
   "\M-x"
   (lambda ()
     (interactive)
     (call-interactively
      (intern
       (ido-completing-read
        "M-x "
        (all-completions "" obarray 'commandp)))))))
