(use-package auto-complete
  :ensure t
  :defer t)

(use-package expand-region
  :ensure t
  :bind
  (("C-=" . er/expand-region)
   ("C-+" . er/contract-region)))

(use-package wgrep
  :ensure t
  :defer t)

(use-package magit
  :ensure t
  :defer t)

;; (use-package rainbow-mode
;;   :ensure t
;;   :config
;;   ;; Load both major and minor modes in one call based on file type
;;   (defun all-css-modes() (css-mode) (rainbow-mode))
;;   (add-to-list 'auto-mode-alist '("\\.css$" . all-css-modes)))

(use-package pointback
  :defer t
  :ensure t
  :init
  (global-pointback-mode))

(use-package markdown-mode
  :defer t
  :ensure t
  :mode "\\.md$")

;; package to present nice undo tree, activated with: C-x u
(use-package undo-tree
  :defer t
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamp)
  (setq undo-tree-visualizer-diff t))

(use-package web-mode
  :mode
  ("\\.phtml\\'"
   "\\.tpl\\.php\\'"
   "\\.jsp\\'"
   "\\.as[cp]x\\'"
   "\\.erb\\'"
   "\\.mustache\\'"
   "\\.djhtml\\'"
   "\\.html?\\'"))

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :config
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode)))

(use-package transpose-frame
  :ensure t)

(use-package color-theme-sanityinc-tomorrow
  :ensure t)
