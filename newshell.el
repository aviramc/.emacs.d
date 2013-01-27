;;
;; Create a new shell
;;


(require 'fshell)

(defun new-shell ()
  "Create a new *shell* buffer. If shell buffers already exist, create another one"
  (interactive)
  (fshell t))

(provide 'newshell)