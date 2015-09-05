;; Configure color themes

(use-package monokai-theme
  :ensure t)

(use-package leuven-theme
  :ensure t)

(defun dark ()
  "Activate default dark theme (monokai)."
  (interactive)
  (disable-theme 'leuven)
  (load-theme 'monokai t))

(defun light ()
  "Activate default light theme (leuven)."
  (interactive)
  (disable-theme 'monokai)
  (load-theme 'leuven t))
