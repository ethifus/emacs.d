;; -*- mode: Emacs-Lisp; folding-mode: t -*-
;; Copyright (C) 2009-2018 Bartosz Biały
;;
;; This file is free software licensed under the terms of the
;; GNU General Public License, version 3 or later.

;; (package-initialize)

(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))

(require 'init-paths)
(require 'init-packages)
(require 'init-basics)
(require 'init-themes)
(require 'init-ibuffer)
(require 'init-org)
(require 'init-ido)
(require 'init-eshell)

(require 'init-project-management)
(require 'init-filestree)
(require 'init-translate)
(require 'init-spelling)
(require 'init-common)
(require 'init-custom-functions)

(require 'init-golang)
(require 'init-python)
(require 'init-web)
(require 'init-irony)
(require 'init-web-typescript)
(require 'init-lisp)

;; Load local configuration specific for this machine. The best place for this
;; file is ~/.emacs.d/lisp/init-local.el.
(require 'init-local nil 'noerror)
