;; enable Org functionality
(use-package org
  :config
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (setq org-src-fontify-natively t
        org-completion-use-ido t
        org-edit-timestamp-down-means-later t
        org-export-kill-product-buffer-when-displayed t
        org-ellipsis "…"
        org-support-shift-select t
        org-hide-emphasis-markers t)
  (font-lock-add-keywords
   'org-mode
   '(("^ +\\([-*]\\) "
      (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•")))))))

(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


(provide 'init-org)
