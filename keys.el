;;
;; Keys configuration
;;

(require 'user-macros)
(require 'custom-functions)

(global-set-key "\C-xc" 'save-buffers-kill-emacs)

(global-set-key [pause] 'kill-this-buffer)
(global-set-key [(control tab)] 'other-window)
(global-set-key [f6] 'switch-to-other-buffer)
(global-set-key [(control \`)] 'switch-to-other-buffer)
(global-set-key [(control z)] 'undo)
(global-set-key [(control b)] 'ido-switch-buffer)
(global-set-key [(control f)] 'ido-find-file)
(global-set-key [(control o)] 'ido-switch-buffer-other-window)
(global-set-key [f2] 'new-shell)
(global-set-key [(control f2)] 'shell)
(global-set-key [f10] 'call-last-kbd-macro)
(global-set-key [f9] 'compile)
(global-set-key [(alt f9)] 'grep)
(global-set-key [(control f9)] 'grep-find)
(global-set-key [f4] 'next-error)
(global-set-key [f5] 'delete-other-windows)
(global-set-key [(shift f4)] 'previous-error)
(global-set-key [f11] 'kmacro-name-last-macro)

;; Buffer switching
(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") 'split-horizontally-change-other-window)
(global-set-key (kbd "C-3") 'split-vertically-change-other-window)
(global-set-key (kbd "C-0") 'delete-window)
; Let's see which key binding I'll use most...
(global-set-key (kbd "C-M-`") 'switch-windows)
(global-set-key (kbd "C-~") 'switch-windows)
(global-set-key [(control f6)] 'switch-windows)

;; C-a is normally C-1, so here we override it
(global-set-key (kbd "C-a") 'beginning-of-line-nomark)

;; sexp switching/marks
(global-set-key [(meta left)] 'backward-sexp)
(global-set-key [(meta right)] 'forward-sexp)
(global-set-key [(meta shift left)] 'backward-sexp-mark)
(global-set-key [(meta shift right)] 'forward-sexp-mark)
(global-set-key [(meta backspace)] 'backward-kill-word)    ;; Don't deleting the entire sexp; too harmful...

(global-set-key [(control meta left)] 'next-buffer)
(global-set-key [(control meta right)] 'previous-buffer)
(global-set-key [(f1)] 'man)

(global-set-key (kbd "C-SPC") 'dabbrev-expand)

(global-set-key "\M-g" 'goto-line)
(global-set-key [(control meta b)] 'toggle-truncate-lines)

(require 'python-mode)

;; Undo the idiotic Python C-backspace, this will be set back to default
(define-key python-mode-map [(control backspace)] nil)

;; Smarter shell completion
(define-key shell-mode-map [(control up)] 'comint-previous-matching-input-from-input)
(define-key shell-mode-map [(control down)] 'comint-next-matching-input-from-input)

(global-set-key "\M-\\" 'shell-command-on-region-inplace)

(global-set-key (kbd "C-c s") 'search-in-internet)
(global-set-key (kbd "C-c b") 'browse-url)

(global-set-key (kbd "C-c r") 'revert-buffer)

(provide 'keys)
