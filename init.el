;; -*- mode: Emacs-Lisp; folding-mode:t -*-
;; Copyright (C) 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016 Bartosz Biały
;;
;; This file is free software licensed under the terms of the
;; GNU General Public License, version 3 or later.


;; add local paths to PATH enviroment
(setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "~/.local/bin")))

;; add local binary locations
(setq exec-path (append exec-path (list (expand-file-name "~/.local/bin"))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))  ;; path to custom modules
(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))  ;; path to init scripts

(require 'init-packages)
(require 'init-basics)
(require 'init-ibuffer)
(require 'init-org)
(require 'init-ido)
(require 'init-eshell)
(require 'init-golang)
(require 'init-python)
(require 'init-projectile)
(require 'init-filestree)
(require 'init-themes)
(require 'init-translate)
(require 'init-other)
(require 'init-custom-functions)
(require 'init-web)
