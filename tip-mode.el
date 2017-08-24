;;; tip-mode.el --- Mode for editing programs written in TIP (Tiny Imperative Programming Language)

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

;;     (add-to-list 'auto-mode-alist '("\\.tip\\'" . tip-mode))

;;; Code:

(defgroup tip nil
  "TIP code editing commands for Emacs."
  :prefix "tip-"
  :group 'languages)

(defconst tip-font-lock-keywords
  `(
    ;; Keywords.
    ("\\<\\(if\\|else\\|while\\|return\\|input\\|output\\|var\\)\\>"
     (1 font-lock-keyword-face))

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
    ("\\(*\\|&\\)"
     (1 font-lock-negation-char-face))
    ("\\(null\\)"
     (1 font-lock-constant-face))
    ("\\<\\(malloc\\)\\>"
     (1 font-lock-builtin-face))

    ;; Integers.
    ("\\([0-9]*\\)"
     (1 font-lock-constant-face))

    ;; Binary operators.
    ("\\(+\\|-\\|*\\|/\\|>\\|==\\)"
     (1 font-lock-negation-char-face))

    )
  "Expressions to highlight in TIP modes.")

(defcustom tip-mode-hook nil
  "*Hook called by `tip-mode'."
  :type 'hook
  :group 'tip)

(defvar tip-mode-syntax-table nil
  "Syntax table used in TIP mode.")

(defvar tip-mode-map nil
  "Keymap for `tip-mode'.")

(defun tip-mode ()
  "Major mode for editing TIP programs."
  (interactive)

  (kill-all-local-variables)
  (setq major-mode 'tip-mode)
  (setq mode-name "TIP")

  (setq tip-mode-map (make-sparse-keymap))
  (use-local-map tip-mode-map)

  (set (make-local-variable 'font-lock-defaults)
       '(tip-font-lock-keywords nil nil))

  (setq tip-mode-syntax-table (make-syntax-table))
  (set-syntax-table tip-mode-syntax-table)

  (set (make-local-variable 'comment-start) "/*")
  (set (make-local-variable 'comment-end) "*/")

  (run-hooks 'tip-mode-hook))

(provide 'tip-mode)

;;; tip-mode.el ends here
