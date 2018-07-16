;; Configure color themes and switching between dark and light theme.

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
  (eth/tone-down-fringes)
  (setq custom-enabled-themes (list theme-symbol)))

(defun eth/tone-down-fringes ()
  "Set fringes color to the same as background color."
  (interactive)
  (set-face-attribute 'fringe nil
                      :foreground (face-foreground 'default)
                      :background (face-background 'default)))

(defun light ()
  "Activate light theme from `light-theme-name' variable."
  (interactive)
  (eth/enable-single-theme (intern light-theme-name)))

(defun dark ()
  "Activate dark theme from `dark-theme-name' variable."
  (interactive)
  (eth/enable-single-theme (intern dark-theme-name)))

(defvar after-load-theme-hook nil
  "Hook run after a color theme is loaded using `load-theme'.")

(defadvice load-theme (after run-after-load-theme-hook activate)
  "Run `after-load-theme-hook'."
  (run-hooks 'after-load-theme-hook))

(add-hook 'after-load-theme-hook 'eth/tone-down-fringes)
(eth/tone-down-fringes)


(provide 'init-themes)
