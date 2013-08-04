;;;; darkpastel-theme.el --- dark background and pastel
;;
;; Copyright(C) 2011-2013 Youhei SASAKI All rights reserved.
;;
;; Author: Youhei SASAKI <uwabami@gfd-dennou.org>
;;         Syohei YOSHIDA <syohex@gmail.com>
;; URL: https://github.com/uwabami/color-theme-darkpastel
;; Version: 0.1
;; License: GPL-3+
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; Code:

(deftheme darkpastel
  "dark background + pastel font-lock
   @see https://github.com/uwabami/color-theme-darkpastel")

(let ((class '((class color) (min-colors 89)))
      (my:low-black   "#020202")
      (my:black       "#242424")
      (my:hi-black    "#4c4c4c")
      (my:low-red     "#a52424")
      (my:red         "#ff4c4c")
      (my:hi-red      "#ff7f7f")
      (my:low-green   "#4ca54c")
      (my:green       "#4cff4c")
      (my:hi-green    "#7fff7f")
      (my:low-yellow  "#a5a54c")
      (my:yellow      "#ffff4c")
      (my:hi-yellow   "#ffff7f")
      (my:low-blue    "#4c4ca5")
      (my:blue        "#4c4cff")
      (my:hi-blue     "#7f7fff")
      (my:low-cyan    "#4ca5a5")
      (my:cyan        "#4cffff")
      (my:hi-cyan     "#7fffff")
      (my:low-magenta "#a54ca5")
      (my:magenta     "#ff4cff")
      (my:hi-magenta  "#ff7fff")
      (my:low-white   "#777777")
      (my:white       "#cccccc")
      (my:hi-white    "#f6f3e7")
      ;; additional colors
      (my:pink        "#ff7fbf")
      (my:purple      "#bf7fff")
      (my:orange      "#ffbf7f")
      (my:sky         "#7fbfff")
      ;; (my:aqua        "#7fffbf")   ; not used
      ;; (my:lawgreen    "#bfff7f")   ; not used
      )
  (custom-theme-set-faces
   'darkpastel
   ;; basic coloring
       `(default
          ((((class color) (min-colors 4096))
            (:foreground ,my:hi-white :background ,my:black))
           (((class color) (min-colors 256))
            (:foreground ,my:hi-white :background ,my:black))
           (,class
            (:foreground ,my:hi-white :background ,my:black))))
       `(cursor                              ((,class (:background ,my:low-cyan ))))
       `(escape-glyph                        ((,class (:foreground ,my:low-yellow :weight bold))))
       `(fringe                              ((,class (:background ,my:low-black ))))
       `(highlight                           ((,class (:background ,my:hi-black :underline t ))))
       `(region                              ((,class (:background ,my:hi-black ))))
       `(secondary-selection                 ((,class (:background ,my:low-blue ))))
       `(minibuffer-prompt                   ((,class (:foreground ,my:red ))))
       `(mode-line                           ((,class (:foreground ,my:hi-white :background ,my:hi-black
                                                                   :box (:line-width -1 :style released-button)))))
       `(mode-line-inactive                  ((,class (:foreground ,my:black :background ,my:hi-black ))))
       `(mode-line-buffer-id                 ((,class (:weight bold))))
       `(mode-line-emphasis                  ((,class (:weight bold))))
       `(mode-line-highlight                 ((,class (:box (:line-width -1 :color ,my:white :style released-button)))))
       `(button                              ((,class (:foreground ,my:hi-white
                                                                   :box (:line-width -1 :style released-button )))))
       `(link                                ((,class (:foreground ,my:hi-cyan :underline t ))))
       `(link-visited                        ((,class (:foreground ,my:magenta :underline t ))))
       `(header-line                         ((,class (:foreground ,my:green ))))
       `(tooltip                             ((,class (:foreground ,my:black :background ,my:yellow ))))
       `(shadow                              ((,class (:foreground ,my:white ))))
       `(isearch                             ((,class (:foreground ,my:hi-white :background ,my:low-blue ))))
       `(isearch-fail                        ((,class (:background ,my:low-red ))))
       `(lazy-highlight                      ((,class (:foreground ,my:hi-white :background ,my:low-green ))))
       `(match                               ((,class (:background ,my:low-blue ))))
       `(next-error                          ((,class (:foreground ,my:magenta ))))
       `(query-replace                       ((,class (:background ,my:low-magenta ))))
       `(trailing-whitespace                 ((,class (:background ,my:hi-red ))))
       `(font-lock-builtin-face              ((,class (:foreground ,my:hi-blue ))))
       `(font-lock-comment-delimiter-face    ((,class (:foreground ,my:low-white ))))
       `(font-lock-comment-face              ((,class (:foreground ,my:low-white ))))
       `(font-lock-constant-face             ((,class (:foreground ,my:orange ))))
       `(font-lock-doc-face                  ((,class (:foreground ,my:low-green ))))
       `(font-lock-doc-string-face           ((,class (:foreground ,my:low-green ))))
       `(font-lock-function-name-face        ((,class (:foreground ,my:purple ))))
       `(font-lock-keyword-face              ((,class (:foreground ,my:hi-red ))))
       `(font-lock-negation-char-face        ((,class (:foreground ,my:hi-cyan ))))
       `(font-lock-preprocessor-face         ((,class (:foreground ,my:pink ))))
       `(font-lock-regexp-grouping-backslash ((,class (:foreground ,my:red :bold t))))
       `(font-lock-regexp-grouping-construct ((,class (:foreground ,my:purple :bold t))))
       `(font-lock-string-face               ((,class (:foreground ,my:hi-green ))))
       `(font-lock-type-face                 ((,class (:foreground ,my:hi-yellow ))))
       `(font-lock-variable-name-face        ((,class (:foreground ,my:sky ))))
       `(font-lock-warning-face              ((,class (:foreground ,my:hi-magenta :weight bold))))
       `(show-paren-match-face               ((,class (:background ,my:hi-black ))))
       `(show-paren-mismatch-face            ((,class (:background ,my:low-red ))))
       )
  (custom-theme-set-variables
   'darkpastel
   '(ansi-color-names-vector
     ["#242424"   ; black
      "#ff4c4c"   ; red
      "#4cff4c"   ; green
      "#ffff4c"   ; yellow
      "#4c4cff"   ; blue
      "#4cffff"   ; cyan
      "#ff4cff"   ; magenta
      "#f6f3e8"   ; white
      ]))
  ) ;; top (let

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'darkpastel)
;; Local Variables:
;; coding: utf-8-unix
;; after-save-hook: (lambda () (byte-compile-file (buffer-file-name)))
;; indent-tabs-mode: nil
;; End:
;;
;;; darkpastel-theme.el ends here
