(require 'package)
(package-initialize nil)
(setq package-archives
	  '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)
(setq use-package-verbose t)
;; (eval-when-compile
;;   (require 'use-package))
;; (require 'dimish)
;; (require 'bind-key)


(provide 'init-packages)
