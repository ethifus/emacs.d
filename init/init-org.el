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
        org-hide-emphasis-markers t)
  (font-lock-add-keywords
   'org-mode
   '(("^ +\\([-*]\\) "
      (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Allow to execute code from SRC block in those languages.
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((sh . t)
                                 (gnuplot . t)
                                 (python . t)
                                 (emacs-lisp . t)))

  (setq org-default-notes-file "~/work/notes.org")
  (setq org-capture-templates
        '(("n" "Note" entry (file+datetree "~/work/notes.org") "* %?\n  %i")
          ("w" "Words" item (file "~/work/words.org") "%?\n")
          ("l" "Log time" entry
           (file+datetree (expand-file-name (format-time-string "~/work/timeline_%Y.org") org-directory))
           "**** %?\n    %i" :clock-in)))

  (add-hook 'org-mode-hook
            (lambda ()
              (progn
                (auto-fill-mode t)
                (setq ispell-local-dictionary "pl")
                (flyspell-mode t)))))

(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Automatically detect language and setup flyspell-mode.
;; (use-package guess-language
;;   :ensure t
;;   :init
;;   (setq guess-language-languages '(en pl))
;;   (add-hook 'text-mode-hook (lambda () (guess-language-mode 1))))


(provide 'init-org)
