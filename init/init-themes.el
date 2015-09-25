;; Configure color themes

(defun dark ()
  "Activate default dark theme (monokai)."
  (interactive)
  (use-package monokai-theme :ensure t)
  (disable-theme 'leuven)
  (load-theme 'monokai t))

(defun light ()
  "Activate default light theme (leuven)."
  (interactive)
  (use-package leuven-theme :ensure t)
  (disable-theme 'monokai)
  (load-theme 'leuven t))
