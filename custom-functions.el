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

(provide 'custom-functions)
