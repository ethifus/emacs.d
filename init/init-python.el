(use-package python-mode
  :ensure t
  :mode "\\.py\\'"
  :interpreter ("python" . python-mode)
  :config
  (define-key python-mode-map (kbd "C->") 'python-indent-shift-right)
  (define-key python-mode-map (kbd "C-<") 'python-indent-shift-left)
  :init
  (add-hook
   'python-mode-hook
   (lambda ()
     (setq py-smart-indentation nil
           indent-tabs-mode nil)
     (auto-complete-mode nil) ;; disable auto-complete (use company-mode instead)
     (auto-highlight-symbol-mode)
     (electric-indent-local-mode t)
     (ispell-change-dictionary "english")
     (flyspell-prog-mode)))
  (add-hook 'python-mode-hook 'jedi:setup))

(use-package jedi
  :ensure t
  :init
  (setq jedi:setup-keys t
        jedi:complete-on-dot t))

;; Use company-mode instead of auto-complete with jedi.
(use-package company-jedi
  :ensure t
  :init
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-jedi)))

(defun elpy-goto-definition-or-rgrep ()
  "Go to the definition of the symbol at point, if found. Otherwise, run `elpy-rgrep-symbol'."
    (interactive)
    (ring-insert find-tag-marker-ring (point-marker))
    (condition-case nil (elpy-goto-definition)
        (error (elpy-rgrep-symbol
                (concat "\\(def\\|class\\)\s" (thing-at-point 'symbol) "(")))))

(use-package elpy
  :ensure t
  :bind (:map elpy-mode-map
              ("M-." . elpy-goto-definition-or-rgrep)
              ("M-," . pop-tag-mark))
  :config
  (setq elpy-rpc-backend "jedi")
  :init
  (elpy-enable)
  (elpy-use-ipython))

;; Hihghlight symbol under cursor.
(use-package auto-highlight-symbol
  :ensure t
  :diminish highlight-mode)


(provide 'init-python)
