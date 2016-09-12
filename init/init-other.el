(use-package auto-complete
  :ensure t
  :defer t
  :config
  (setq ac-show-menu-immediately-on-auto-complete t))

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
  (setq undo-tree-visualizer-timestamp)
  (setq undo-tree-visualizer-diff t))

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

(use-package racket-mode
  :ensure t
  :defer t)

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'racket-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode))

;; Display available keybindings in popup.
(use-package which-key
  :ensure t
  :defer t)


(provide 'init-other)
