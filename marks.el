;;
;;
;;

(defun mark-previous-sexp ()
  (interactive)
  (backward-sexp)
  (mark-sexp)
)

(provide 'marks)