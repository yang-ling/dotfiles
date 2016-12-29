(spacemacs/set-leader-keys "an" 'notmuch)
(with-eval-after-load "notmuch"
  (define-key notmuch-show-mode-map (kbd "u") 'spacemacs/avy-open-url)
  (define-key notmuch-show-mode-map (kbd "U") 'spacemacs/avy-goto-url)
  (define-key notmuch-show-mode-map (kbd "g") 'evil-avy-goto-char)
  (define-key 'notmuch-show-part-map "d" 'my-notmuch-show-view-as-patch))
