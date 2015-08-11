(require 'package)
(package-initialize nil)
(setq package-archives
	  '(("gnu" . "http://elpa.gnu.org/packages/")
        ;; ("marmalade" . "http://marmalade-repo.org/packages/")
        ;; ("tromey" . "http://tromey.com/elpa/")
        ("melpa" . "http://melpa.org/packages/")
        ;; ("elpy" . "http://jorgenschaefer.github.io/packages/")
        ))


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
