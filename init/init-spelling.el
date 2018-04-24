(use-package ispell
  :no-require t
  :bind (("C-c i c" . ispell-comments-and-strings)
         ("C-c i d" . ispell-change-dictionary)
         ("C-c i k" . ispell-kill-ispell)
         ("C-c i m" . ispell-message)
         ("C-c i r" . ispell-region)))


(defun fd-switch-dictionary ()
  "Toggle ispell dictionary."
  (interactive)
  (let* ((dic ispell-current-dictionary)
         (change (if (string= dic "polish") "english" "polish")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)))

(global-set-key (kbd "<f8>") 'fd-switch-dictionary)

(use-package guess-language
  :ensure t
  :diminish guess-language-mode
  :hook (test-mode . guess-language-mode)
  :config
  (setq guess-language-languages '(en pl)))


(provide 'init-spelling)
