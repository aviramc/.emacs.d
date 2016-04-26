;; Functions that I wrote/found on the internet, and are useful.

(defun shell-command-on-region-inplace (start end command)
  "Run shell-command-on-region interactivly replacing the region in place"
  (interactive (let (string) 
    	 (unless (mark)
    	   (error "The mark is not set now, so there is no region"))
    	 ;; Do this before calling region-beginning
    	 ;; and region-end, in case subprocess output
    	 ;; relocates them while we are in the minibuffer.
    	 ;; call-interactively recognizes region-beginning and
    	 ;; region-end specially, leaving them in the history.
    	 (setq string (read-from-minibuffer "Shell command on region: "
    					    nil nil nil
    					    'shell-command-history))
    	 (list (region-beginning) (region-end)
    	       string)))
  (shell-command-on-region start end command t t)
)

; C language - insert header guard.
; Greatly inspired by (i.e. copied from) https://www.emacswiki.org/emacs/AutoInsertHeaderGuards
(defun c-insert-header-guard ()
  (interactive)
  (if (buffer-file-name)
      (let*
          ((name (upcase (file-name-nondirectory (file-name-sans-extension buffer-file-name))))
           (guard-name (concat "__" name "_H__"))
           (start-guard (concat "#ifndef " guard-name "\n#define " guard-name "\n"))
           (end-guard (concat "\n#endif /* " guard-name "*/\n"))
           (begin (point-marker))
           )
        (progn
  	  ;Insert the Header Guard
          (goto-char (point-min))
          (insert start-guard)
          (goto-char (point-max))
          (insert end-guard)
          (goto-char begin))
      )
      ;else
      (message (concat "Buffer " (buffer-name) " must have a filename"))
  )
)

(provide 'custom-functions)
