;; -*- mode: emacs-lisp; origami-fold-style: triple-braces; -*-

;; editorconfig {{{
(with-eval-after-load "editorconfig"
  (add-to-list 'editorconfig-exclude-modes 'emacs-lisp-mode)
  (add-hook 'editorconfig-conf-mode-hook 'smartparens-mode))
;; }}}
