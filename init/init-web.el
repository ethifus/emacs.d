;; Requirements: node.js, npm, typescript.


(use-package js2-mode
   :ensure t
   :mode "\\.js\\'"
   :config
   (add-to-list 'interpreter-mode-alist '("nodejs" . js2-mode))
   (add-hook 'js2-mode-hook #'js2-imenu-extras-mode))

(use-package js2-refactor
  :ensure t
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-r")
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill))

(use-package xref-js2
  :ensure t
  :config
  (define-key js-mode-map (kbd "M-.") nil)
  (add-hook
   'js2-mode-hook
   (lambda ()
     (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))

(use-package typescript-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :mode ("\\.phtml\\'"
         "\\.tpl\\.php\\'"
         "\\.jsp\\'"
         "\\.as[cp]x\\'"
         "\\.erb\\'"
         "\\.mustache\\'"
         "\\.djhtml\\'"
         "\\.html?\\'"
         "\\.tsx\\'"))

;; Allow to quickly test requests to REST APIs.
(use-package restclient
  :ensure t
  :config)


(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'css-mode-hook 'rainbow-mode))


(provide 'init-web)
