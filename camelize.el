;; camelize.el - a module for those unfortunate ones who need to convert symbols to camelCase
;; This provides two commands:
;;   - camelize-var - will convert "aaa_bbb_ccc" to "aaaBbbCcc"
;;   - camelize-type - will convert "aaa_bbb_ccc" to "AaaBbbCcc"
;; Mostly taken from emacswiki:
;;   https://www.emacswiki.org/emacs/CamelCase

(defun mapcar-head (fn-head fn-rest list)
  "Like MAPCAR, but applies a different function to the first element."
  (if list
      (cons (funcall fn-head (car list)) (mapcar fn-rest (cdr list)))))

(defun camelize-cdr (s)
  "Convert under_score string S to camelCase string."
  (mapconcat 'identity (mapcar-head
                        '(lambda (word) (downcase word))
                        '(lambda (word) (capitalize (downcase word)))
                        (split-string s "_")) ""))
(defun camelize-all (s)
  "Convert under_score string S to CamelCase string."
  (mapconcat 'identity (mapcar
                        '(lambda (word) (capitalize (downcase word)))
                        (split-string s "_")) ""))

(defun camelize (camelize-func)
  (interactive)
  (let* ((word (word-at-point))
         (new-word (funcall camelize-func word))
         (bounds (bounds-of-thing-at-point 'word))
         (start (car bounds))
         (end (cdr bounds)))
    (progn (delete-region start end) (insert new-word))))

(defun camelize-var ()
  (interactive)
  (camelize 'camelize-cdr))

(defun camelize-type ()
  (interactive)
  (camelize 'camelize-all))

(provide 'camelize)
