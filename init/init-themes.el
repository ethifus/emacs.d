;; Configure color themes and switching between dark and light theme.

;; (use-package leuven-theme
;;   :ensure t)

;; (use-package gruvbox-theme
;;   :ensure t)

(defgroup light-dark-themes nil
  "Pair of light and dark color theme names used to switch with
 `light' and `dark' command.")

(defcustom light-theme-name "leuven"
  "Light color theme name."
  :group 'light-dark-themes
  :type '(string))

(defcustom dark-theme-name "gruvbox"
  "Dark color theme name."
  :group 'light-dark-themes
  :type '(string))

(defun eth/enable-single-theme (theme-symbol)
  (mapcar 'disable-theme custom-enabled-themes)
  (load-theme theme-symbol)
  (enable-theme theme-symbol)
  (setq custom-enabled-themes (list theme-symbol)))

(defun light ()
  "Activate light theme from `light-theme-name' variable."
  (interactive)
  (eth/enable-single-theme (intern light-theme-name)))

(defun dark ()
  "Activate dark theme from `dark-theme-name' variable."
  (interactive)
  (eth/enable-single-theme (intern dark-theme-name)))


(provide 'init-themes)
