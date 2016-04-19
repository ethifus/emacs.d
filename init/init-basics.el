;; don't show startup messages
(setq-default inhibit-startup-message t inhibit-startup-echo-area-message t)

;; automatically sync buffer's content with files on disk
(global-auto-revert-mode t)
(setq-default auto-revert-verbose nil)

;; enable syntax highlighting
(global-font-lock-mode t)

;; marked block will be highlighted
(setq-default transient-mark-mode t)

;; replace marked block with input
(delete-selection-mode t)

;; allways add new line on end of file
(setq-default require-final-newline t)

;; enable incrementall complete in minibuffer
(icomplete-mode t)

;; turn off auto save
(setq-default auto-save-default nil)

;; turn off backup
(setq-default backup-inhibited t)

;; force spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default indent-line-function 'insert-tab)

;; do not ask for password to often
(setq password-cache-expiry (* 60 15))

;; trust all themes
(setq custom-safe-themes t)

;; set default major-mode to text-mode
(setq-default major-mode 'text-mode)

;; set frame title format 
(setq frame-title-format '(buffer-file-name "%f - Emacs" ("%b - Emacs")))

;; highlight current line
(global-hl-line-mode t)

;; remove menu bar and tool bar
(menu-bar-mode 0)
(tool-bar-mode 0)

(set-frame-font "DejaVuSansMono 11")

(defun setup-frame-decorations (frame)
  "Setup frame decoration in window-system"
  (with-selected-frame frame
    (when (window-system frame)
      (tool-bar-mode 0)  ;; remove tool bar
      (menu-bar-mode 0)  ;; remove menu bar
      (scroll-bar-mode t)  ;; remove scroll bars
      (set-fringe-mode '(8 . 0))  ;; set fringe size
      (blink-cursor-mode t)  ;; turn on blinking cursor
      (setq-default cursor-type 'bar))))

;; apply each frame setting
(add-hook 'after-make-frame-functions 'setup-frame-decorations)


;; start emacs server when not in daemon mode
(if (not (daemonp)) (server-start))


;; show current column number in status line
(setq column-number-mode t)

;; highlight matching parentheses when the point is on them
(show-paren-mode t)

;; add closing bracket automatically
(electric-pair-mode t)

;; Automatically indent on new line
;(electric-indent-mode t)

;; less flickery display
(setq redisplay-dont-pause t)

;; do smooth scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position t)

;; default row width
(setq-default fill-column 80)

;; save buffers state and settings on emacs exit
(desktop-save-mode t)

;; load session even if it's locked
(setq desktop-load-locked-desktop t)

; save a list of recent files visited
(recentf-mode t)

;; change all yes/no prompts to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; set default C formatting style
(setq-default c-default-style "stroustrup")

;; use standard editing shortcuts for C-c, C-v, C-x, C-z
(cua-mode t)

;; don't tabify after rectangle commands
(setq-default cua-auto-tabify-rectangles nil)

;; standard Windows behaviour
(setq-default cua-keep-region-after-copy t)

;; copy-paste should work with other X clients
(setq-default x-select-enable-clipboard t
              x-select-enable-primary t
              interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; ignore case when completing filenames
(setq completion-ignore-case t
      read-file-name-completion-ignore-case t)

;; be smart about filenames in minibuffer
(file-name-shadow-mode t)

;; stop C-<left/right> on CamelCases 
(global-subword-mode t)

;; mode to undo/redo windows layout with C-<left>/C-<right>
(winner-mode t)

;; default to dabbrev-expand for the smart expand stuff
(global-set-key (kbd "M-/") 'dabbrev-expand)

;; use xdg-open as a default browser
(setq browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "xdg-open")

;; set regexp for tramp-shell, so that it would work with zsh
(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

;; save places in files between sessions
(require 'saveplace)
(setq-default save-place t)

(setq-default initial-scratch-message ";; scratch buffer created -- happy hacking\n")

;; don't let the cursor go into minibuffer prompt
(setq minibuffer-prompt-properties
      (quote
       (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

;; When popping the mark, continue popping until the cursor
;; actually moves
(defadvice pop-to-mark-command (around ensure-new-position activate)
  (let ((p (point)))
    (dotimes (i 10)
      (when (= p (point)) ad-do-it))))

(setq set-mark-command-repeat-pop t)

;; automatically close unused buffers
(require 'midnight)


;; custom key bindings

;; always search with regexps
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; invoke isearch-occur with C-o (default is M-s o) -- this shortcut
;; is due to old habits
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

(global-set-key (kbd "<XF86Back>") 'scroll-down)
(global-set-key (kbd "<XF86Forward>") 'scroll-up)

;; allows to switch windows with M-S-<up>, M-S-<down>, M-S-<left> and
;; M-S-<right>
(global-set-key (kbd "M-<left>")  'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>")    'windmove-up)
(global-set-key (kbd "M-<down>")  'windmove-down)

;; list of recently opened files
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(global-set-key (kbd "C-c g") 'rgrep)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-3") 'split-window-right)

(defun kill-default-buffer ()
  "Kill the currently active buffer -- set to C-x k so that users
are not asked which buffer they want to kill."
  (interactive)
  (let (kill-buffer-query-functions) (kill-buffer)))

(global-set-key (kbd "C-x C-k") 'kill-default-buffer)

;; clean up spaces
(global-set-key (kbd "M-SPC") 'cycle-spacing)

(global-set-key (kbd "<f2>") 'toggle-truncate-lines)

;; load custom settings (those changed with M-x customize)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

