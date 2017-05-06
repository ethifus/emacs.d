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
     (auto-highlight-symbol-mode)
     (electric-indent-local-mode t))))

;; Use company-mode instead of auto-complete with jedi.
(use-package company-jedi
  :ensure t
  :init
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-jedi))
  (setq jedi:setup-keys t
        jedi:complete-on-dot t))

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
  (setq
   python-shell-interpreter "python3"
   elpy-rpc-python-command "python3"
   elpy-rpc-backend "jedi"
   elpy-modules
   (quote (elpy-module-company
           elpy-module-eldoc
           elpy-module-flymake
           elpy-module-pyvenv
           elpy-module-yasnippet
           elpy-module-django
           elpy-module-sane-defaults)))
  :init
  (elpy-enable)
  (elpy-use-ipython))

;; Hihghlight symbol under cursor.
(use-package auto-highlight-symbol
  :ensure t
  :diminish highlight-mode)

;; Maintain order in imports. This requires isort to be installed.
(use-package py-isort
  :ensure t
  :init
  (setq py-isort-options '("--lines=100" "--multi_line=3" "--trailing-comma"))
  (add-hook 'before-save-hook 'py-isort-before-save))

(defun isort-toggle-hook ()
  "Toggle isort before-save-hook."
  (interactive)
  (if (member 'py-isort-before-save before-save-hook)
      (progn
        (remove-hook 'before-save-hook 'py-isort-before-save)
        (message "isort disabled"))
    (progn
      (add-hook 'before-save-hook 'py-isort-before-save)
      (message "isort enabled"))))


(provide 'init-python)
