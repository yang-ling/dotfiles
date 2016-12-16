;; -*- mode: emacs-lisp; origami-fold-style: triple-braces; -*-
;; Settings {{{
(setq browse-url-browser-function 'browse-url-chrome
      evil-escape-delay 0.5
      evil-escape-key-sequence "fd"
      evil-search-wrap nil
      scroll-margin 5)

(with-eval-after-load "tramp"
  (setenv "SHELL" "/bin/bash")
  (setenv "ESHELL" "/bin/bash"))
(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")
(spacemacs/toggle-visual-line-navigation-on)
(global-visual-line-mode)
;; }}}
;; Encodings {{{
;; Chinese
(prefer-coding-system 'cp936)
;; Japanese
(prefer-coding-system 'cp932)
;; Default
(prefer-coding-system 'utf-8)
;; }}}
;; Hooks {{{
(add-hook 'message-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("^[ \t]*>[ \t]*>[ \t]*>[ \t]*>.*$"
                                       (0 'markdown-blockquote-face))
                                      ("^[ \t]*>[ \t]*>[ \t]*>.*$"
                                       (0 'info-double-quoted-name))
                                      ("^[ \t]*>[ \t]*>.*$"
                                       (0 'info-quoted-name))))))
(add-hook 'dos-mode-hook 'smartparens-mode)
(add-hook 'message-mode-hook 'smartparens-mode)
(add-hook 'conf-mode-hook 'smartparens-mode)
;; }}}
;; Mode {{{
(add-to-list 'auto-mode-alist '("\\.message\\'" . message-mode))
(add-to-list 'auto-mode-alist '("\\.install\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.asc$" . auto-encryption-armored-mode))
(add-to-list 'auto-mode-alist '("\\.timer$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.service$" . conf-unix-mode))

(add-to-list 'interpreter-mode-alist '("bash" . shell-script-mode))
;; }}}
;; company settings {{{
(setq company-dabbrev-ignore-case t)
(setq company-dabbrev-code-ignore-case t)
(global-company-mode)
;; }}}
;; Easy Templates {{{
;; http://orgmode.org/manual/Easy-Templates.html
;; s	#+BEGIN_SRC ... #+END_SRC
;; e	#+BEGIN_EXAMPLE ... #+END_EXAMPLE
;; q	#+BEGIN_QUOTE ... #+END_QUOTE
;; v	#+BEGIN_VERSE ... #+END_VERSE
;; c	#+BEGIN_CENTER ... #+END_CENTER
;; l	#+BEGIN_LaTeX ... #+END_LaTeX
;; L	#+LaTeX:
;; h	#+BEGIN_HTML ... #+END_HTML
;; H	#+HTML:
;; a	#+BEGIN_ASCII ... #+END_ASCII
;; A	#+ASCII:
;; i	#+INDEX: line
;; I	#+INCLUDE: line
;;
;; When Emacs first visits an Org file, the global state is set to OVERVIEW, i.e., only the
;; top level headlines are visible . This can be configured through the variable org-startup-
;; folded, or on a per-file basis by adding one of the following lines anywhere in the buffer:
;; #+STARTUP: overview
;; #+STARTUP: content
;; #+STARTUP: showall
;; #+STARTUP: showeverything
(add-to-list 'org-structure-template-alist '("n" "#+NAME: ?"))
(add-to-list 'org-structure-template-alist '("t" "#+TITLE: ?"))
;; }}}
;; notmuch {{{
(add-to-list 'notmuch-saved-searches '(:name "my-unread" :query "tag:unread and tag:interested" :key "m"))
;; }}}
;; fcitx {{{
;; Make sure the following comes before `(fcitx-aggressive-setup)'
(fcitx-aggressive-setup)
(fcitx-prefix-keys-add "M-m") ; M-m is common in Spacemacs
(setq fcitx-use-dbus t) ; uncomment if you're using Linux
;; }}}
;; epa settings for asc file {{{
(setq epa-file-name-regexp "\\.\\(gpg\\|\\asc\\)\\(~\\|\\.~[0-9]+~\\)?\\'")
(epa-file-name-regexp-update)
;; Minor mode for ASCII-armored gpg-encrypted files
(define-minor-mode auto-encryption-armored-mode
  "Save files in encrypted, ASCII-armored format"
  ;; The initial value.
  nil
  ;; The indicator for the mode line.
  " Encrypted,Armored"
  ;; The minor mode bindings.
  nil
  (if (symbol-value auto-encryption-armored-mode)
      (set (make-local-variable 'epa-armor) t)
    (kill-local-variable 'epa-armor)))
;; }}}
