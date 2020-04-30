(require 'package)
(package-initialize)

(setq package-check-signature nil)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)
(setq use-package-verbose t)


(provide 'init-packages)
