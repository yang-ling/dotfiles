;; chinese-fonts-setup
(eval-after-load 'cnfonts
  '(progn
     ;; Put chinese-fonts-setup into startup
     (cnfonts-enable)
     ;; Show Unicode icon in spacemacs mode-line correctly.
     (cnfonts-set-spacemacs-fallback-fonts)))
