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

(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

(require 'settings)
(require 'marks)
(require 'ido)
(require 'pc-select)
(require 'quick-yes)
(require 'newshell)
(require 'lua-mode)
(require 'git)
(require 'git-blame)
(require 'internet-search)
(require 'xcscope)
(require 'camelize)
(require 'dockerfile-mode)

(autoload 'zop-to-char "zop-to-char.el" nil t)
(autoload 'zop-up-to-char "zop-to-char.el" nil t)

(require 'bash-completion)
(bash-completion-setup)
;; Don't add spaces on partial completions of paths
(set 'bash-completion-nospace t)

;; Mercurial mode files. We have them in our repository, but:
;;   - mercurial.el is distributed with Mercurial.
;;   - ahg.el is from https://bitbucket.org/agriggio/ahg/
(require 'mercurial)
(require 'ahg)

;; Java module - JDEE. This is a bit old, but works fine.
(if (file-exists-p "~/.emacs.d/jdee/lisp")
    (progn (add-to-list 'load-path "~/.emacs.d/jdee/lisp")
           (load "jde")))

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

;; Remove toolbar
(tool-bar-mode -1)

(require 'pymacs)

;; Oren Zomer's prettify!
(setq pymacs-load-path (list "~/.emacs.d"))
(pymacs-load "prettify" "")

(require 'fontsize)

;; Load keys the last, in order to override bad key bindings
(require 'keys)

(defvaralias 'last-command-char 'last-command-event)


