;; Don't show startup messages.
(setq-default inhibit-startup-message t
              inhibit-startup-echo-area-message t)

;; Automatically sync buffer's content with files on disk.
(use-package autorevert
  :diminish (auto-revert-mode . " ↺")
  :init
  (global-auto-revert-mode t))

;; Enable syntax highlighting.
(global-font-lock-mode t)

;; Marked block will be highlighted.
(setq-default transient-mark-mode t)

;; Replace marked block with input.
(delete-selection-mode t)

;; Allways add new line on end of file.
(setq-default require-final-newline t)

;; Enable incrementall complete in minibuffer.
(icomplete-mode t)

;; Turn off auto save.
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;; Turn off backup.
(setq-default backup-inhibited t)

;; Force spaces instead of tabs.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default indent-line-function 'insert-tab)

;; Do not ask for password to often.
(setq password-cache-expiry (* 60 15))

;; Set default major-mode to text-mode.
(setq-default major-mode 'text-mode)

;; Set frame title format.
(setq frame-title-format '(buffer-file-name "%f - Emacs" ("%b - Emacs")))

;; Highlight current line.
(global-hl-line-mode t)

(defun setup-frame-decorations ()
  "Setup frame decoration in window-system"
  (tool-bar-mode 0)  ;; remove tool bar
  (menu-bar-mode 0)  ;; remove menu bar
  (scroll-bar-mode 0)  ;; remove scroll bars
  (set-fringe-mode '(10 . 0))  ;; set fringe size
  (blink-cursor-mode t)  ;; turn on blinking cursor
  (setq-default cursor-type 'bar)
  (set-frame-font "DejaVuSansMono 11"))
  (setq-default cursor-type 'box)

(when (display-graphic-p)
  (setup-frame-decorations))

;; Apply settings to each frame.
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame (setup-frame-decorations))))

;; Default frame geometry.
(add-to-list 'default-frame-alist '(height . 35))
(add-to-list 'default-frame-alist '(width . 120))

;; Show current column number in status line.
(setq column-number-mode t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode t)

;; Add closing bracket automatically.
(electric-pair-mode t)

;; Disable electric-indent-mode by default.
(electric-indent-mode 0)

;; Less flickery display.
(setq redisplay-dont-pause t)

;; Do smooth scrolling.
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position t)

;; Default row width.
(setq-default fill-column 80)

;; Enable visual bell.
(setq visible-bell t)

;; Save buffers state and settings on emacs exit.
(desktop-save-mode t)

;; Load session even if it's locked.
(setq desktop-load-locked-desktop t)

; Save a list of recent files visited.
(recentf-mode t)

;; Change all yes/no prompts to y/n.
(fset 'yes-or-no-p 'y-or-n-p)

;; Use standard editing shortcuts for C-c, C-v, C-x, C-z.
(cua-mode t)

;; Don't tabify after rectangle commands.
(setq-default cua-auto-tabify-rectangles nil)

;; Copy-paste should work with other X clients.
(setq-default x-select-enable-clipboard t
              x-select-enable-primary t
              interprogram-paste-function 'gui-selection-value)

;; Ignore case when completing filenames.
(setq completion-ignore-case t
      read-file-name-completion-ignore-case t)

;; Be smart about filenames in minibuffer.
(file-name-shadow-mode t)

;; Stop cursor at CamelCase names with C-<left>/C-<right> movements.
(use-package subword
  :diminish
  :init
  (global-subword-mode))

;; Mode to undo/redo windows layout with C-c <left>/C-c <right>.
(winner-mode t)
(setq winner-ring-size 10)

;; Default to dabbrev-expand for the smart expand stuff.
(global-set-key (kbd "M-/") 'dabbrev-expand)

;; Use xdg-open as a default browser.
(setq browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "xdg-open")

;; Set faster method to access files through tramp.
(setq tramp-default-method "ssh")

;; Add human readable size to dired
(setq dired-listing-switches "-alh")

;; Save places in files between sessions.
(require 'saveplace)
(setq-default save-place t)

(setq-default initial-scratch-message
              (format
               ";; GNU Emacs %s, started on: %s.\n"
               emacs-version
               (current-time-string)))

;; Don't let the cursor go into minibuffer prompt.
(setq minibuffer-prompt-properties
      (quote
       (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

;; When popping the mark, continue popping until the cursor actually moves.
(defun modi/multi-pop-to-mark (orig-fun &rest args)
  "Call ORIG-FUN until the cursor moves.
Try the repeated popping up to 10 times."
  (let ((p (point)))
    (dotimes (i 10)
      (when (= p (point))
        (apply orig-fun args)))))
(advice-add 'pop-to-mark-command :around #'modi/multi-pop-to-mark)

(setq set-mark-command-repeat-pop t)

;; Setup unique buffers name.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Delete trailing whitespace before save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Custom key bindings.

;; Always search with regexps.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Invoke isearch-occur with C-o (default is M-s o) -- this shortcut is due to
;; old habits.
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

(global-set-key (kbd "<XF86Back>") 'scroll-down)
(global-set-key (kbd "<XF86Forward>") 'scroll-up)

(global-set-key (kbd "C-c r") 'rgrep)
(global-set-key (kbd "C-c f") 'find-name-dired)
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-3") 'split-window-right)

;; Rebind upcase-word, downcase-word and capitalize-word.
(global-set-key (kbd "M-u") 'upcase-dwim)
(global-set-key (kbd "M-l") 'downcase-dwim)
(global-set-key (kbd "M-c") 'capitalize-dwim)

(defun kill-default-buffer ()
  "Kill the currently active buffer -- set to C-x k so that users
are not asked which buffer they want to kill."
  (interactive)
  (let (kill-buffer-query-functions) (kill-buffer)))

(global-set-key (kbd "C-x C-k") 'kill-default-buffer)

;; Clean up spaces.
(global-set-key (kbd "M-SPC") 'cycle-spacing)

(global-set-key (kbd "<f2>") 'toggle-truncate-lines)

;; Translate M-<tab> to C-<tab> to avoid clash with WM.
(define-key function-key-map [(control tab)] [?\M-\t])

;; Start emacs server when not in daemon mode.
(if (not (daemonp)) (server-start))


;; Load custom settings (those changed with M-x customize).
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(setq custom-theme-directory "~/.emacs.d/lisp")


(provide 'init-basics)
