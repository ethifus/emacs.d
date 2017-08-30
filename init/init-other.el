;; Use company-mode as a completion framework.
(use-package company
  :ensure t
  :config
  (global-company-mode)
  (add-hook 'prog-mode-hook 'company-mode))

(use-package expand-region
  :ensure t
  :bind
  (("C-=" . er/expand-region)
   ("C-+" . er/contract-region)))

;; Allows to edit grep buffer (with C-c C-p in grep buffer).
(use-package wgrep
  :ensure t)

;; Create new buffer for each grep results.
(use-package grep-a-lot
  :ensure t)

;; Interface to Git.
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-completing-read-function 'magit-ido-completing-read))

(use-package magit-popup
  :ensure t)

;; Present nice undo tree, activated with C-x u.
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamp t
        undo-tree-visualizer-diff nil))

;; On-the-fly syntax checking.
(use-package flycheck
  :ensure t)

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
  :config
  (which-key-mode))

;; Display ugly ^L page breaks as tidy horizontal lines.
(use-package page-break-lines
  :ensure t
  :diminish page-break-lines-mode
  :config
  (global-page-break-lines-mode))

;; Build in package. Add ANSI colors in *compilation* buffer.
(use-package ansi-color
  :init
  (defun endless/colorize-compilation ()
    "Colorize from `compilation-filter-start' to `point'."
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region
       compilation-filter-start (point))))
  (add-hook 'compilation-filter-hook #'endless/colorize-compilation))

;; Hihghlight changes in buffer after some operation.
(use-package volatile-highlights
  :ensure t
  :diminish volatile-highlights-mode)

(use-package multiple-cursors
  :ensure t
  :bind
  (("C-S-<mouse-1>" . mc/add-cursor-on-click)))

;; Allow to move line or region up or down.
(use-package move-text
  :ensure t
  :init
  (global-set-key (kbd "M-S-<up>") 'move-text-up)
  (global-set-key (kbd "M-S-<down>") 'move-text-down))

;; Copy or cut whole line with M-w and C-w when no region is selected.
(use-package whole-line-or-region
  :ensure t
  :diminish whole-line-or-region-mode)


;; Configuration related to movment and windows configuration.

;; Restore window points when returning to buffers.
(use-package pointback
  :ensure t
  :config
  (global-pointback-mode))

;; Allow to easily move frames.
(use-package transpose-frame
  :ensure t)

(use-package browse-kill-ring
  :ensure t
  :bind ("C-c k" . browse-kill-ring))

(use-package imenu-list
  :ensure t
  :bind ("C-'" . imenu-list-smart-toggle)
  :config
  (setq imenu-list-focus-after-activation t))

;; Allow to open files inside docker containers.
(use-package docker-tramp
  :ensure t)


;; Additional file modes.

;; Make sure to set `markdown-command'.
(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :config
  (setq markdown-nested-imenu-heading-index t
        markdown-command "markdown2"))

(use-package yaml-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package kotlin-mode
  :ensure t)

(use-package flycheck-kotlin
  :ensure t
  :init
  (add-hook 'kotlin-mode-hook 'flycheck-mode))


(provide 'init-other)
