# tip-mode
Emacs major mode for Tiny Imperative Programming Language (TIP) as defined in the lecture notes on [Static Program Analysis](http://cs.au.dk/~amoeller/spa) by Anders Møller and Michael I. Schwartzbach.

### Usage
To use this mode simply load `tip-mode.el` and enable `tip-mode` for `.tip` files by adding the following two lines to your `.emacs` file or similar.
```common-lisp
(load "~/path/to/tip-mode.el")
(add-to-list 'auto-mode-alist '("\\.tip\\'" . tip-mode))
```