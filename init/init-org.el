;; enable Org functionality
(use-package org
  :config
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (setq org-src-fontify-natively t
        org-completion-use-ido t
        org-edit-timestamp-down-means-later t
        org-export-kill-product-buffer-when-displayed t
        org-ellipsis "…"))
