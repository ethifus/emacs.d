;; Requirements: node.js, npm, typescript, tern.

(defun setup-js2-mode ()
  (flycheck-mode 1)
  (auto-highlight-symbol-mode t)
  (electric-indent-local-mode t))

(use-package js2-mode
   :ensure t
   :mode "\\.js\\'"
   :hook ((js2-mode . js2-imenu-extras-mode)
          (js2-mode . setup-js2-mode))
   :config
   (add-to-list 'interpreter-mode-alist '("nodejs" . js2-mode)))

(use-package js2-refactor
  :ensure t
  :hook (js2-mode . js2-refactor-mode)
  :config
  (js2r-add-keybindings-with-prefix "C-c C-r")
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill))

(use-package xref-js2
  :ensure t
  :config
  (define-key js-mode-map (kbd "M-.") nil)
  (add-hook 'js2-mode-hook
            (lambda ()
              (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))

;; company-tern (and tern) provides integration to ternjs (https://ternjs.net).
;; Make sure than tern is installed with: npm install -g tern
(use-package company-tern
  :ensure t
  :config
  (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook
            (lambda ()
              (tern-mode)
              (company-mode)))
  ;; Disable completion keybindings, as we use xref-js2 instead.
  (define-key tern-mode-keymap (kbd "M-.") nil)
  (define-key tern-mode-keymap (kbd "M-,") nil))

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


(provide 'init-web)
