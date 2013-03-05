;;
;; Colors settings and other settings
;;

(defun switch-to-other-buffer ()
  (interactive)
  (switch-to-buffer nil)
)

(custom-set-variables
 '(compilation-scroll-output t)
 '(truncate-lines t)              ;; Line-wrapping
 '(blink-matching-paren t)
 '(gc-cons-threshold 20000000)
 '(bell-volume 0)
 '(font-lock-maximum-size 400000)
 '(blink-cursor nil)
 '(truncate-partial-width-windows t)
 '(standard-indent 4)
 '(load-home-init-file t t)
 '(indent-tabs-mode nil)
 '(global-font-lock-mode t nil (font-lock))
 '(efs-use-passive-mode t))
(custom-set-faces
 '(default ((t (:foreground "White" :background "black" :size "14t"))))
; '(custom-button-face ((t (:bold t :foreground "#3fdfcf"))))
; '(custom-group-tag-face ((t (:underline t :foreground "blue"))))
; '(custom-saved-face ((t (:underline t :foreground "orange"))))
; '(custom-state-face ((t (:foreground "green3"))))
; '(custom-variable-button-face ((t (:bold t :underline t :foreground "white"))))
 '(font-lock-comment-face ((t (:foreground "gray"))))
 '(font-lock-doc-string-face ((t (:foreground "cyan"))))
 '(font-lock-function-name-face ((t (:foreground "forestgreen" :bold t))))
 '(font-lock-keyword-face ((t (:foreground "orange"))))
 '(font-lock-preprocessor-face ((t (:foreground "deepskyblue" :bold t))))
 '(font-lock-reference-face ((t (:foreground "orangered"))))
 '(font-lock-string-face ((t (:foreground "cyan"))))
 '(font-lock-type-face ((t (:foreground "green3" :bold t))))
 '(font-lock-variable-name-face ((t (:foreground "gold" :bold t))))
 '(font-lock-warning-face ((t (:foreground "yellow"  :bold t))))
 '(highlight ((t (:foreground "red3" :background "white"))) t)
 '(isearch ((t (:foreground "red" :background "lightslategray"))) t)
 '(lazy-highlight ((t (:foreground "red" ))) t)
 '(text-cursor ((t (:foreground "white" :background "red"))) t)
 '(region ((t (:background "skyblue4"))) t)
)

;; Run "xlsfonts | grep courier-medium-r" to view available fonts
;; For this font, you should install on your machine the the package xfonts-75dpi.
(set-default-font "-adobe-courier-medium-r-normal--14-140-75-75-m-90-iso8859-1")

;; Set the default font for new frames. This is helpful when doing new-frame[-on-display] or when running emacsclient.
(add-to-list 'default-frame-alist
             '(font . "-adobe-courier-medium-r-normal--14-140-75-75-m-90-iso8859-1"))

;; Shell mode
(setq ansi-color-names-vector ; better contrast colors
      ["black" "orangered" "green4" "yellow4"
       "deepskyblue" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Emacs22 adaptaion
(tool-bar-mode nil)

(setq grep-find-history '("find . -type f -print0 | xargs -0 -e grep -n "))
(setq lazy-highlight-initial-delay '0)
(setq show-paren-delay '0)
;TODO: This doesn't work. Find out why.
;;(setq show-paren-style '((t (:foreground "red" ))))
(show-paren-mode t)
(line-number-mode t)
(column-number-mode t)

;; Set C-x c to quit, not C-x C-c
(global-set-key [(control x) (control c)] (defun dont-kill-emacs() (interactive) (message "Use C-x c to leave emacs")))
(global-set-key [(control x) c] 'save-buffers-kill-emacs)

;; Colors displayed by diff mode.
(defun update-diff-colors ()
  "update the colors for diff faces"
  (set-face-attribute 'diff-added nil
                      :foreground "white" :background "darkgreen")
  (set-face-attribute 'diff-removed nil
                      :foreground "white" :background "darkred")
  (set-face-attribute 'diff-changed nil
                      :foreground "white" :background "purple"))
(eval-after-load "diff-mode"
  '(update-diff-colors))

;; Don't ask before killing a buffer with a running process.
;; This list holds hooks to run before killing a buffer, and it has originally contained only process-kill-buffer-query-function.
;; In order to restore the default, remove this line or replace it with: (setq kill-buffer-query-functions 'process-kill-buffer-query-function)
(setq kill-buffer-query-functions nil)

;; Set google-chrome as the default browser.
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

(provide 'settings)
