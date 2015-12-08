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
(add-to-load-path (expand-file-name "~/.emacs.d/dockerfile-mode"))
(add-to-load-path (expand-file-name "/usr/share/emacs/site-lisp/python-mode"))

(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

(require 'settings)
(require 'marks)
;;(defvaralias 'python-mode-map 'py-mode-map)
(require 'python-mode)
;;(python-mode-v5-behavior-p-on)
(require 'ido)
(require 'pc-select)
(require 'quick-yes)
(require 'newshell)
(require 'lua-mode)
(require 'git)
(require 'internet-search)
(require 'xcscope)

;; Mercurial mode files. We have them in our repository, but:
;;   - mercurial.el is distributed with Mercurial.
;;   - ahg.el is from https://bitbucket.org/agriggio/ahg/
(require 'mercurial)
(require 'ahg)

(ido-mode t)
(font-lock-mode)
(pc-selection-mode)

(custom-set-variables
 '(truncate-lines t)
)

;; Make Emacs split horizontally by default (i.e when doing grep/completion/C-h b)
(setq split-height-threshold nil)
(setq split-width-threshold nil)

;; Turn off bell alarms
(setq ring-bell-function 'ignore)


;; Oren Zomer's prettify!
(require 'pymacs)

;;(setq pymacs-load-path (list "~/.emacs.d"))
;;(pymacs-load "pyaddons" "")

;; Load keys the last, in order to override bad key bindings
(require 'keys)

(require 'dockerfile-mode)

(defvaralias 'last-command-char 'last-command-event)

