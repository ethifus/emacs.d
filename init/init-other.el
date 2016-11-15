;; Use company-mode as a completion framework.
(use-package company
  :ensure t
  :defer t
  :init
  (global-company-mode)
  :config
  (add-hook 'prog-mode-hook 'company-mode))

(use-package expand-region
  :ensure t
  :bind
  (("C-=" . er/expand-region)
   ("C-+" . er/contract-region)))

;; Allows to edit grep buffer (with C-c C-p in grep buffer).
(use-package wgrep
  :ensure t
  :defer t)

(use-package magit
  :ensure t
  :defer t)

;; Package to present nice undo tree, activated with C-x u.
(use-package undo-tree
  :defer t
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamp t)
  (setq undo-tree-visualizer-diff nil))

;; Yasnippet package. By default custom snippets should be placed in
;; ~/.emacs.d/snippets.
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode t)
  ;; Disable yassnippet for term-mode.
  (add-hook 'term-mode-hook (lambda() (yas-minor-mode -1))))

;; Display available keybindings in popup.
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init
  (which-key-mode))


;; Configuration related to movment and windows configuration.
;; Restore window points when returning to buffers.
(use-package pointback
  :defer t
  :ensure t
  :init
  (global-pointback-mode)
  (setq magit-completing-read-function 'magit-ido-completing-read))

(use-package transpose-frame
  :ensure t)

;; Additional file modes.
;; Make sure to set `markdown-command'.
(use-package markdown-mode
  :defer t
  :ensure t
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package yaml-mode
  :ensure t
  :defer t)


(provide 'init-other)
