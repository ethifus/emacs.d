;; Don't show startup messages.
(setq-default inhibit-startup-message t inhibit-startup-echo-area-message t)

;; Automatically sync buffer's content with files on disk.
(global-auto-revert-mode t)

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
(setq-default auto-save-default nil)

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

;; Remove menu bar and tool bar.
(menu-bar-mode 0)
(tool-bar-mode 0)

(set-frame-font "DejaVuSansMono 11")

(defun setup-frame-decorations (frame)
  "Setup frame decoration in window-system"
  (with-selected-frame frame
    (tool-bar-mode 0)  ;; remove tool bar
    (menu-bar-mode 0)  ;; remove menu bar
    (scroll-bar-mode 0)  ;; remove scroll bars
    (set-fringe-mode '(8 . 0))  ;; set fringe size
    (blink-cursor-mode t)  ;; turn on blinking cursor
    (setq-default cursor-type 'bar)))

;; Apply each frame setting.
(add-hook 'after-make-frame-functions 'setup-frame-decorations)


;; Start emacs server when not in daemon mode.
(if (not (daemonp)) (server-start))


;; Show current column number in status line.
(setq column-number-mode t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode t)

;; Add closing bracket automatically.
(electric-pair-mode t)

;; Less flickery display.
(setq redisplay-dont-pause t)

;; Do smooth scrolling.
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position t)

;; Default row width.
(setq-default fill-column 80)

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

;; Standard Windows behaviour.
(setq-default cua-keep-region-after-copy t)

;; Copy-paste should work with other X clients.
(setq-default x-select-enable-clipboard t
              x-select-enable-primary t
              interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; Ignore case when completing filenames.
(setq completion-ignore-case t
      read-file-name-completion-ignore-case t)

;; Be smart about filenames in minibuffer.
(file-name-shadow-mode t)

;; Stop C-<left/right> on CamelCases.
(global-subword-mode t)

;; Mode to undo/redo windows layout with C-<left>/C-<right>.
(winner-mode t)

;; Default to dabbrev-expand for the smart expand stuff.
(global-set-key (kbd "M-/") 'dabbrev-expand)

;; Use xdg-open as a default browser.
(setq browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "xdg-open")

;; Set faster method to access files through tramp.
(setq tramp-default-method "ssh")

;; Save places in files between sessions.
(require 'saveplace)
(setq-default save-place t)

(setq-default initial-scratch-message ";; scratch buffer created -- happy hacking\n")

;; Don't let the cursor go into minibuffer prompt.
(setq minibuffer-prompt-properties
      (quote
       (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

;; When popping the mark, continue popping until the cursor actually moves.
(defadvice pop-to-mark-command (around ensure-new-position activate)
  (let ((p (point)))
    (dotimes (i 10)
      (when (= p (point)) ad-do-it))))

(setq set-mark-command-repeat-pop t)

;; Automatically close unused buffers.
(require 'midnight)

;; Setup unique buffers name.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Allow to scroll during isearch.
(setq isearch-allow-scroll t)

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

;; Allows to switch windows with M-<up>, M-<down>, M-<left> and M-<right>;
;; bind-keys* allows to bind key sequence that is alway available.
(bind-keys*
 ((kbd "M-<left>") . windmove-left)
 ((kbd "M-<right>") . windmove-right)
 ((kbd "M-<up>") . windmove-up)
 ((kbd "M-<down>") . windmove-down))

(global-set-key (kbd "C-c g") 'rgrep)
(global-set-key (kbd "C-c f") 'find-name-dired)
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

;; Clean up spaces.
(global-set-key (kbd "M-SPC") 'cycle-spacing)

(global-set-key (kbd "<f2>") 'toggle-truncate-lines)


;; Load custom settings (those changed with M-x customize).
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)


(provide 'init-basics)
