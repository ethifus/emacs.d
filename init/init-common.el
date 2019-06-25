;; Use company-mode as a completion framework.
(use-package company
  :hook (prog-mode . company-mode)
  :ensure t
  :config
  (global-company-mode))

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

;; (use-package magit-popup
;;   :ensure t)

(use-package diff-hl
  :ensure t
  :hook (prog-mode . turn-on-diff-hl-mode))

;; Present nice undo tree, activated with C-x u.
(use-package undo-tree
  :ensure t
  :diminish
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
  (yas-global-mode 1)
  ;; Disable yassnippet for term-mode.
  (add-hook 'term-mode-hook (lambda() (yas-minor-mode -1))))

(use-package yasnippet-snippets
  :ensure t)

;; Display available keybindings in popup.
(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode))

;; Display ugly ^L page breaks as tidy horizontal lines.
(use-package page-break-lines
  :ensure t
  :diminish
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

(use-package multiple-cursors
  :ensure t
  :bind
  (("C-S-<mouse-1>" . mc/add-cursor-on-click)
   ("C-c m c" . mc/edit-lines)
   ("C-c m e" . mc/edit-ends-of-lines)
   ("C-c m a" . mc/mark-all-like-this)
   ("C-c m n" . mc/mark-next-like-this)))

;; Allow to move line or region up or down.
(use-package move-text
  :ensure t
  :bind (("M-S-<up>" . move-text-up)
         ("M-S-<down>" . move-text-down)))

;; Hihghlight symbol under cursor.
(use-package auto-highlight-symbol
  :ensure t
  :diminish
  :hook (prog-mode . auto-highlight-symbol-mode))

(use-package dimmer
  :ensure t
  :init
  (setq dimmer-fraction 0.3)
  (dimmer-mode t))

;; Allow to open files inside docker containers.
(use-package docker-tramp
  :ensure t
  :defer t)

;; Use .editorconfig files.
(use-package editorconfig
  :ensure t
  :diminish
  :config
  (editorconfig-mode 1))

;; Automaitcally save buffers when they lost focus or when idle.
(use-package super-save
  :diminish super-save-mode
  :ensure t
  :init
  (super-save-mode t)
  (setq super-save-idle-duration 300
        auto-save-default nil))

;; Allow to quickly test requests to REST APIs.
(use-package restclient
  :ensure t
  :config)

(use-package rainbow-mode
  :ensure t
  :hook (css-mode-hook . rainbow-mode))

(use-package browse-kill-ring
  :ensure t
  :bind ("C-c k" . browse-kill-ring))

(use-package imenu-list
  :ensure t
  :bind* ("C-'" . imenu-list-smart-toggle)
  :config
  (setq imenu-list-focus-after-activation t
        imenu-max-item-length nil))


;; Configuration related to movment and windows configuration.

;; Restore window points when returning to buffers.
(use-package pointback
  :ensure t
  :config
  (global-pointback-mode))

;; Allow to easily move frames.
(use-package transpose-frame
  :ensure t)

;; Allows to switch windows with M-<up>, M-<down>, M-<left> and M-<right>;
;; bind-keys* allows to bind key sequence that is alway available.
(use-package windmove
  :bind* (("M-<left>" . windmove-left)
          ("M-<right>" . windmove-right)
          ("M-<up>" . windmove-up)
          ("M-<down>" . windmove-down)))

(use-package framemove
  :config
  (setq framemove-hook-into-windmove t))


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
  :hook (kotlin-mode . flycheck-mode))


(provide 'init-common)
