;; Use company-mode as a completion framework.
(use-package company
  :ensure t
  :defer t
  :init
  (global-company-mode))

(use-package expand-region
  :ensure t
  :bind
  (("C-=" . er/expand-region)
   ("C-+" . er/contract-region)))

;; Writable grep buffer and apply the changes to files.
(use-package wgrep
  :ensure t
  :defer t)

(use-package magit
  :ensure t
  :defer t)

;; Restore window points when returning to buffers.
(use-package pointback
  :defer t
  :ensure t
  :init
  (global-pointback-mode))

;; Make sure to set `markdown-command'.
(use-package markdown-mode
  :defer t
  :ensure t
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

;; Package to present nice undo tree, activated with: C-x u.
(use-package undo-tree
  :defer t
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamp t)
  (setq undo-tree-visualizer-diff nil))

(use-package transpose-frame
  :ensure t)

;; Yasnippet package. By default custom snippets should be placed in
;; ~/.emacs.d/snippets.
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode t)
  ;; disable yassnippet for term-mode
  (add-hook 'term-mode-hook (lambda() (yas-minor-mode -1))))

;; Display available keybindings in popup.
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode))

(use-package yaml-mode
  :ensure t
  :defer t)


(provide 'init-other)
