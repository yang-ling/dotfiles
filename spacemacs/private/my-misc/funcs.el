(defun create-temp-file ()
    "Create a temp file"
    (interactive)
    (make-temp-file "emacs"))

(defun mu-xml-format ()
    "Format an XML buffer with `xmllint'."
    (interactive)
    (shell-command-on-region (point-min) (point-max)
        "xmllint -format -"
        (current-buffer)
        t
        "*Xmllint Error Buffer*"
        t))
