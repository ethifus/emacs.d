;; Enable Org functionality.
(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c c" . org-capture)
         ("C-c l" . org-store-link)
         ("C-c a" . org-agenda))
  :config
  (setq org-src-fontify-natively t
        org-completion-use-ido t
        org-edit-timestamp-down-means-later t
        org-export-kill-product-buffer-when-displayed t
        org-ellipsis "…"
        org-support-shift-select t
        org-hide-emphasis-markers t
        org-clock-into-drawer nil
        org-imenu-depth 5
        org-clock-rounding-minutes 15
        org-clock-in-resume t
        org-time-clocksum-format
            (quote (:hours "%d"
                    :require-hours t
                    :minutes ":%02d"
                    :require-minutes t)))
  (font-lock-add-keywords
   'org-mode
   '(("^ +\\([-*]\\) "
      (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Allow to execute code from SRC block in those languages.
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((shell . t)
                                 (gnuplot . t)
                                 (python . t)
                                 (emacs-lisp . t)
                                 (ditaa . t)))
  (setq org-ditaa-jar-path "/usr/bin/ditaa")
  (add-hook 'org-mode-hook
            (lambda ()
              (progn
                (auto-fill-mode t)
                (setq ispell-local-dictionary "pl")
                (flyspell-mode t))))
  :init
  (setq org-default-notes-file "~/notes/notes.org")
  (setq org-capture-templates
        '(("n" "Note" entry (file+datetree "~/notes/notes.org") "* %?\n  %i")
          ("w" "Word" item (file "~/notes/words.org") "%?\n")
          ("l" "Log time" entry
           (file+datetree (expand-file-name (format-time-string "~/notes/work/timeline_%Y.org") org-directory))
           "**** %?\n    %i" :clock-in t :clock-keep t)))
  (setq org-todo-keywords '((sequence "TODO(t)" "BLOCKED(b)" "|" "DONE(d)" "CANCELLED(c)"))))

(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


(provide 'init-org)
