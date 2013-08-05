;;
;; Initial Emacs load file
;;

;; Add the given path to the load-path variable.
(defun add-to-load-path (path-string)
  (message (format "Passed %S..." path-string))
  (if (stringp path-string)
      (when (file-exists-p path-string)
	(message (format "Adding %S to load-path..." path-string))
	(add-to-list 'load-path (expand-file-name path-string)))
    (crs-add-to-load-path (car path-string))
    (if (cdr path-string)
	(crs-add-to-load-path (cdr path-string)))))

(add-to-load-path (expand-file-name "~/.emacs.d"))
(add-to-load-path (expand-file-name "/usr/share/emacs/site-lisp/python-mode"))

(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

(require 'settings)
(require 'marks)
(defvaralias 'python-mode-map 'py-mode-map)
(require 'python-mode)
(require 'ido)
(require 'pc-select)
(require 'quick-yes)
(require 'newshell)
(require 'lua-mode)
(require 'git)
(require 'internet-search)

(ido-mode t)
(font-lock-mode)
(pc-selection-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-term-color-vector
   [unspecified "#110F13" "#b13120" "#719f34" "#ceae3e" "#7c9fc9" "#7868b5" "#009090" "#F4EAD5"])
 '(bell-volume 0)
 '(blink-cursor-mode nil)
 '(blink-matching-paren t)
 '(compilation-scroll-output t)
 '(custom-safe-themes
   (quote
    ("dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" "68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "5bff694d9bd3791807c205d8adf96817ee1e572654f6ddc5e1e58b0488369f9d" "30fe7e72186c728bd7c3e1b8d67bc10b846119c45a0f35c972ed427c45bacc19" "1177fe4645eb8db34ee151ce45518e47cc4595c3e72c55dc07df03ab353ad132" "854dc57026d3226addcc46b2b460034a74609edbd9c14e626769ac724b10fcf5" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" "787574e2eb71953390ed2fb65c3831849a195fd32dfdd94b8b623c04c7f753f0" "d26c1e1b5497c2118820d70455652681a8776df23c2bc202ab4d3c9a8171b9d4" default)))
 '(efs-use-passive-mode t)
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#202020")
 '(font-lock-maximum-size 400000)
 '(frame-brackground-mode (quote dark))
 '(fringe-mode 10 nil (fringe))
 '(gc-cons-threshold 20000000)
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(linum-format " %6d ")
 '(load-home-init-file t t)
 '(main-line-color1 "#222912")
 '(main-line-color2 "#09150F")
 '(main-line-separator-style (quote chamfer))
 '(powerline-color1 "#222912")
 '(powerline-color2 "#09150F")
 '(standard-indent 4)
 '(truncate-lines t)
 '(truncate-partial-width-windows t)
 '(nyan-wavy-trail t))

;; Make Emacs split horizontally by default (i.e when doing grep/completion/C-h b)
(setq split-height-threshold nil)
(setq split-width-threshold nil)

;; Turn off bell alarms
(setq ring-bell-function 'ignore)

;; Turn off welcome screen
(setq inhibit-startup-message t)

;; Set a nice scratch message
(setq initial-scratch-message ";; welcome, h4x0r.

")

;; load theme
(require 'zenburn-theme)
(load-theme 'zenburn t)
(enable-theme 'zenburn)

;; disable tool bar
(tool-bar-mode -1)

;; add marmalade elpa repo
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; activate nyan-mode (nyan cat location indicator in the modeline)
(require 'nyan-mode)
(nyan-mode t)
(nyan-start-animation)

;; activate rainbow mode (look for colors and show them nicely)
(require 'rainbow-mode)
(rainbow-mode)

;; Load keys the last, in order to override bad key bindings
(require 'keys)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
