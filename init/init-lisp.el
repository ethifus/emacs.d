;; Anything connected with lisp editing (racket, elisp, etc.).

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode))


(provide 'init-lisp)
