;; chinese-fonts-setup
(eval-after-load 'chinese-fonts-setup
  '(progn
     ;; Put chinese-fonts-setup into startup
     (chinese-fonts-setup-enable)
     ;; Show Unicode icon in spacemacs mode-line correctly.
     (cfs-set-spacemacs-fallback-fonts)))
