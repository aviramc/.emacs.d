;;
;; Keys configuration
;;

(require 'user-macros)
(require 'custom-functions)

(global-set-key [pause] 'kill-this-buffer)
(global-set-key [(control tab)] 'other-window)
(global-set-key [f6] 'switch-to-other-buffer)
(global-set-key [(control \`)] 'switch-to-other-buffer)
(global-set-key [(control shift iso-lefttab)] (lambda () (interactive) (other-window -1)))
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

;; More convenient mark bindings (we override C-SPC later on)
(global-set-key (kbd "C-c m") 'set-mark-command)
(global-set-key (kbd "C-c C-m") 'set-mark-command)
;; C-x C-x will exchange point with the mark, here we also highlight it.
(global-set-key (kbd "C-S-x C-S-x") 'exchange-point-and-mark)
(global-set-key (kbd "C-x <up>") 'pop-to-mark-command)
(global-set-key (kbd "C-x C-<up>") 'pop-to-mark-command)
(global-set-key (kbd "M-<up>") 'pop-to-mark-command)


(global-set-key [(control meta left)] 'next-buffer)
(global-set-key [(control meta right)] 'previous-buffer)
(global-set-key [(f1)] 'man)

(global-set-key (kbd "C-SPC") 'dabbrev-expand)

(global-set-key "\M-g" 'goto-line)
(global-set-key [(control meta b)] 'toggle-truncate-lines)

;; Smarter shell completion
(define-key shell-mode-map [(control up)] 'comint-previous-matching-input-from-input)
(define-key shell-mode-map [(control down)] 'comint-next-matching-input-from-input)

(global-set-key "\M-\\" 'shell-command-on-region-inplace)

(global-set-key (kbd "C-c s") 'search-in-internet)
(global-set-key (kbd "C-c b") 'browse-url)

(global-set-key (kbd "C-c r") 'revert-buffer)

(global-set-key (kbd "M-3") 'comment-region)
(global-set-key (kbd "M-#") 'uncomment-region) ;; This is actually M-S-3

;; C-Mode - When pressing on Enter, the next line should be indented. Also, allow to make a newline without indendation.
(require 'cc-mode)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent) 
(define-key c-mode-base-map [(shift return)] 'newline)

(fset 'python-breakpoint
   [up end return ?i ?m ?p ?o ?r ?t ?  ?p ?d ?b ?\; ?  ?p ?d ?b ?. ?s ?e ?t ?_ ?t ?r ?a ?c ?e ?\( ?\) down])

(require 'python)
(define-key python-mode-map (kbd "C-c C-b") 'python-breakpoint)

;; C-Scope keys
(define-key c-mode-base-map (kbd "C-c g") 'cscope-find-global-definition)
(define-key c-mode-base-map (kbd "C-c x") 'cscope-find-functions-calling-this-function)
(define-key c-mode-base-map (kbd "C-c h") 'c-insert-header-guard)

(defun scroll-up-one-line()
  (interactive)
  (scroll-up 1))

(defun scroll-down-one-line()
  (interactive)
  (scroll-down 1))

;; XXX overriding default emacs binding?
(global-set-key [(control meta up)] 'scroll-down-one-line)
(global-set-key [(control meta down)] 'scroll-up-one-line)

(global-set-key (kbd "C-c C-q") 'prettify)

; Camelize
(global-set-key (kbd "C-C <up>") 'camelize-var)

(global-set-key (kbd "C-<return>") 'find-file-at-point)

;; Visual zap to/up to char
(global-set-key (kbd "C-c z") 'zop-to-char)
(global-set-key (kbd "C-c C-z") 'zop-to-char)
(global-set-key (kbd "C-x z") 'zop-up-to-char)
(global-set-key (kbd "C-x C-z") 'zop-up-to-char) ;; XXX: run-over emacs's minimize binding

;; AnsiTerm is another option for a shell that can run htop and screen.
;; Better for using when in need for advanced completion.
;; The most important keys to know there are C-c j and C-c k which switch editing modes.
(global-set-key (kbd "C-c t") 'ansi-term)
(global-set-key (kbd "C-c C-t") 'ansi-term)

;; Find a file with an actual find command and a window
(global-set-key (kbd "C-c f") 'find-name-dired)
(global-set-key (kbd "C-c C-f") 'find-name-dired)

(provide 'keys)
