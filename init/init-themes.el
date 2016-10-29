;; Configure color themes and switching between dark and light theme.

(use-package color-theme-sanityinc-tomorrow
  :defer t
  :ensure t)

(use-package leuven-theme
  :defer t
  :ensure t)

(use-package gruvbox-theme
  :defer t
  :ensure t)

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

(defun enable-single-theme (theme)
  (mapcar 'disable-theme custom-enabled-themes)
  (let ((theme-symbol (intern theme)))
    (load-theme theme-symbol)
    (enable-theme theme-symbol)))

(defun light ()
  "Activate light theme from `light-theme-name' variable."
  (interactive)
  (enable-single-theme light-theme-name))

(defun dark ()
  "Activate dark theme from `light-theme-name' variable."
  (interactive)
  (enable-single-theme dark-theme-name))


(provide 'init-themes)
