;; Settings to work with msmtp
(setq mail-specify-envelope-from t
      send-mail-function 'sendmail-send-it
      sendmail-program "/usr/local/bin/my-send-mail.sh"
      mail-envelope-from 'header
      message-sendmail-f-is-evil nil
      message-sendmail-envelope-from 'header)

;; Automatically check signatures
(setq notmuch-crypto-process-mime t)

(setq notmuch-archive-tags '("-inbox" "+archive" "-unread" "-read-it-later"))
(setq notmuch-print-mechanism 'notmuch-print-muttprint)
(setq notmuch-draft-tags '("+draft" "-inbox" "-unread"))
;; (setq notmuch-draft-tags '("+draft" "-inbox" "-unread")
;;       notmuch-archive-tags '("-inbox" "+archive"))

;; Crypto Settings
;; (add-hook 'message-setup-hook 'mml-secure-sign-pgpmime)
;; (setq epg-gpg-program "/usr/bin/gpg2")
(add-hook 'notmuch-hello-refresh-hook
          (lambda ()
            (if (and (eq (point) (point-min))
                     (search-forward "Saved searches:" nil t))
                (progn
                  (forward-line)
                  (widget-forward 1))
              (if (eq (widget-type (widget-at)) 'editable-field)
                  (beginning-of-line)))))
