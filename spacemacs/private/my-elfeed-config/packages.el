;;; packages.el --- my-elfeed-config layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Yang Ling <yangling@yangling_arch>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `my-elfeed-config-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-elfeed-config/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-elfeed-config/pre-init-PACKAGE' and/or
;;   `my-elfeed-config/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-elfeed-config-packages
  '(elfeed
    elfeed-goodies)
  "The list of Lisp packages required by the my-elfeed-config layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun my-elfeed-config/post-init-elfeed ()
  (defun elfeed-show-visit-w3m ()
    "Visit the current entry in your browser using `w3m-browse-url'."
    (interactive)
    (let ((link (elfeed-entry-link elfeed-show-entry)))
      (when link
        (message "Sent to browser: %s" link)
        (w3m-browse-url link))))
  (defun elfeed-mark-all-as-read ()
    "Mark all as read"
    (interactive)
    (mark-whole-buffer)
    (elfeed-search-untag-all-unread))
  (defun hook-elfeed-settings ()
    (setq elfeed-show-refresh-function 'elfeed-show-refresh--mail-style))
  (add-hook 'elfeed-search-mode-hook 'hook-elfeed-settings)
  (with-eval-after-load "elfeed"
    (define-key elfeed-search-mode-map (kbd "G") nil)
    (define-key elfeed-search-mode-map (kbd "R") 'elfeed-mark-all-as-read)
    (define-key elfeed-show-mode-map (kbd "B") 'elfeed-show-visit-w3m)
    (evil-define-key 'evilified elfeed-show-mode-map "m" 'elfeed-show-next)
    (evil-define-key 'evilified elfeed-show-mode-map "i" 'elfeed-show-prev)
    (run-with-timer 60 (* 20 60) 'elfeed-update)
    (add-hook 'kill-emacs-hook 'elfeed-db-compact)))
(defun my-elfeed-config/post-init-elfeed-goodies ()
  (with-eval-after-load "elfeed-goodies"
    (setq elfeed-goodies/entry-pane-position 'bottom)
    (setq elfeed-goodies/log-window-position 'left)))

;;; packages.el ends here
