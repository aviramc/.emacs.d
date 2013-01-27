;; Put the macros that you want to save here.
;; You can do it this way:
;;   - Record a macro.
;;   - Open this file.
;;   - Perform the command insert-kbd-macro (M-x then insert-kbd-macro).
;;   - Replace the first line with "fset 'name-of-the-macro" instead "setq last-kbd-macro", and put the name of your macro instead "name-of-the-macro".
;; To assign a key to the macros, use the keys.el file.

;; Depends on C-` as 'switch-to-other-buffer
(fset 'split-horizontally-change-other-window
   [?\C-x ?2 C-tab ?\C-`])

(fset 'split-vertically-change-other-window
   [?\C-x ?3 C-tab ?\C-`])

; This is meant for two windows!
(fset 'switch-windows
   [?\C-` C-tab ?\C-` C-tab ?\C-` C-tab])

(provide 'user-macros)
