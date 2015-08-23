;; -*- mode: Emacs-Lisp; folding-mode:t -*-
;; Copyright (C) 2009, 2010, 2011, 2012, 2013, 2014, 2015 Bartosz Biały
;;
;; This file is free software licensed under the terms of the
;; GNU General Public License, version 3 or later.


;; add local paths to PATH enviroment
(setenv "PATH" (concat (getenv "PATH")
                       ":" (expand-file-name "~/.local/go/bin")
                       ":" (expand-file-name "~/work/go/bin")
                       ":" (expand-file-name "~/.local/bin")))

;; add local binary locations
(setq exec-path
      (append exec-path
              (list (expand-file-name "~/.local/go/bin")
                    (expand-file-name "~/work/go/bin")
                    (expand-file-name "~/.local/bin"))))


(add-to-list 'load-path "~/.emacs.d/lisp")  ;; path to custom modules
(add-to-list 'load-path "~/.emacs.d/init")  ;; path to init scripts


(load "init-basics.el")
(load "init-packages.el")
(load "init-ibuffer.el")
(load "init-org.el")
(load "init-ido.el")
(load "init-eshell.el")
(load "init-golang.el")
(load "init-python.el")
(load "init-filestree.el")
(load "init-other.el")
(load "init-custom-functions.el")
