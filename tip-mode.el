;;; tip-mode.el --- Mode for editing programs written in TIP (Tiny Imperative Programming Language)

;; MIT License

;; Copyright (C) 2017 Simon Gregersen <gregersen@cs.au.dk>

;; Author: Simon Gregersen <gregersen@cs.au.dk>
;; Keywords: languages

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:

;; Installation:

;;   (load-file "~/path/to/tip-mode.el")
;;   (add-to-list 'auto-mode-alist '("\\.tip\\'" . tip-mode))

;;; Code:

(defconst tip-font-lock-keywords
  `((
     ;; Keywords.
     ("\\<\\(if\\|else\\|while\\|return\\|input\\|output\\|var\\)\\>"
      . font-lock-keyword-face)

     ;; Variable declarations.
     ("\\<var\\s-+\\([a-zA-Z]\\(\\w\\|_\\)*\\)\\s-*"
      (1 font-lock-variable-name-face))

     ;; Variable assignment.
     ("\\<\\([a-zA-Z]\\(\\w\\|_\\)*\\)\\s-*="
      (1 font-lock-variable-name-face))

     ;; Function declarations.
     ("\\<\\([a-zA-Z]\\(\\w\\|_\\)*\\)\\s-*(.*)\\s-*{"
      (1 font-lock-function-name-face))

     ;; Function call.
     ("\\([a-zA-Z]\\(\\w\\|_\\)*\\)("
      (1 font-lock-function-name-face))

     ;; Pointers.
     ("*\\|&"
      . font-lock-negation-char-face)
     ("\\<null\\>"
      . font-lock-constant-face)
     ("\\<malloc\\>"
      . font-lock-builtin-face)

     ;; Integers.
     ("[0-9]*"
      . font-lock-constant-face)

     ;; Binary operators.
     ("+\\|-\\|*\\|/\\|>\\|=="
      . font-lock-negation-char-face)

     ))
  "Expressions to highlight in TIP mode.")

(defconst tip-tab-width 4)

(define-derived-mode tip-mode c-mode "TIP"
  "Major mode for editing TIP (Tiny Imperative Programming Language)"
  (setq tab-width tip-tab-width)
  (setq font-lock-defaults tip-font-lock-keywords))

(provide 'tip-mode)

;;; tip-mode.el ends here
