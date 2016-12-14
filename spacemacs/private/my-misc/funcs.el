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
(defun my-copy-file-path (choice)
  "Copy the current buffer's file path or dired path to `kill-ring'.
Result is full path.
If `universal-argument' is called first, copy only the dir path.
URL `http://ergoemacs.org/emacs/emacs_copy_file_path.html'
Version 2016-07-17"
  (interactive "c(f)ull file path or (d)irectory path or just file (n)ame:")
  (let ((-fpath
          (if (equal major-mode 'dired-mode)
            (expand-file-name default-directory)
            (if (null (buffer-file-name))
              (user-error "Current buffer is not associated with a file.")
              (buffer-file-name)))))
    (kill-new
      (cond
        ((char-equal ?f choice) (progn
                                  (message "File path copied: 「%s」" -fpath)
                                  -fpath))
        ((char-equal ?d choice) (progn
                                  (message "Directory path copied: 「%s」" (file-name-directory -fpath))
                                  (file-name-directory -fpath)))
        ((char-equal ?n choice) (progn
                                  (message "File name copied: 「%s」" (file-name-nondirectory -fpath))
                                  (file-name-nondirectory -fpath)))
        (t (error "Invalid input"))))))
