(defun font-to-default ()
  (interactive)
  (set-default-font "-adobe-courier-medium-r-normal--14-140-75-75-m-90-iso8859-1"))

(defun font-for-single-screen-dev ()
  (interactive)
  (set-default-font "-adobe-courier-medium-r-normal--18-180-75-75-m-110-iso8859-1"))

(defun font-for-display ()
  (interactive)
  (set-default-font "-adobe-courier-medium-r-normal--25-180-100-100-m-150-iso8859-1"))

(defun font-extra-large ()
  (interactive)
  (set-default-font "-adobe-courier-medium-r-normal--34-240-100-100-m-200-iso8859-1"))

(provide 'fontsize)
