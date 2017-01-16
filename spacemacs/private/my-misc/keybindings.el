(spacemacs/declare-prefix "o" "custom")
(spacemacs/declare-prefix "mo" "major custom")

(spacemacs/set-leader-keys-for-major-mode 'nxml-mode "ox" 'mu-xml-format)
(spacemacs/set-leader-keys-for-major-mode 'org-mode
  "oC" 'org-columns
  "oc" 'org-clone-subtree-with-time-shift
  "oo" 'outline-show-all
  "oO" 'outline-hide-other
  "oh" 'outline-hide-body
  "ol" 'org-toggle-link-display
  "on" 'org-next-link
  "oN" 'org-previous-link)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "gj") 'evil-next-line)
(define-key evil-normal-state-map (kbd "gk") 'evil-previous-line)
(define-key evil-normal-state-map (kbd "0") 'evil-beginning-of-visual-line)
(define-key evil-visual-state-map (kbd "Q") 'fill-paragraph)
(define-key evil-normal-state-map (kbd "Q") 'fill-paragraph)

(spacemacs/set-leader-keys "oo" 'done
  "ob" 'helm-bookmark-rename
  "oB" 'bookmark-set
  "oc" 'my-copy-file-path
  "od" 'clean
  "ok" 'my-kill-dired-buffers
  "oJ" 'justify-current-line
  "oj" 'just-one-space
  "om" 'imenu
  "oy" 'youdao-dictionary-search-at-point+
  "os" 'youdao-dictionary-play-voice-at-point)
