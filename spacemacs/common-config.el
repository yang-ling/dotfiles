;; -*- mode: emacs-lisp; -*-
;; Settings
(setq browse-url-browser-function 'browse-url-firefox
      ;;browse-url-browser-function 'browse-url-chrome
      ;; browse-url-browser-function 'browse-url-default-browser
      evil-escape-delay 0.5
      evil-escape-key-sequence "fd"
      evil-search-wrap nil
      scroll-margin 3
      org-html-validation-link nil)

(with-eval-after-load "tramp"
  (setenv "SHELL" "/bin/bash")
  (setenv "ESHELL" "/bin/bash"))
(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")
(spacemacs/toggle-visual-line-navigation-on)
(global-visual-line-mode)
;; Encodings
;; Chinese
(prefer-coding-system 'cp936)
;; Japanese
(prefer-coding-system 'cp932)
;; Default
(prefer-coding-system 'utf-8)
;; Hooks
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
;; Mode
(add-to-list 'auto-mode-alist '("\\.message\\'" . message-mode))
(add-to-list 'auto-mode-alist '("\\.install\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.asc$" . auto-encryption-armored-mode))
(add-to-list 'auto-mode-alist '("\\.timer$" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.service$" . conf-unix-mode))

(add-to-list 'interpreter-mode-alist '("bash" . shell-script-mode))

;; company settings
(setq company-dabbrev-ignore-case t)
(setq company-dabbrev-code-ignore-case t)
(global-company-mode)

;; Easy Templates
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
(with-eval-after-load "org"
  (add-to-list 'org-structure-template-alist '("n" "#+NAME: ?"))
  (add-to-list 'org-structure-template-alist '("t" "#+TITLE: ?")))
(with-eval-after-load "ox-latex"
  ;; (add-to-list 'org-latex-packages-alist '("" "minted"))
  ;; (add-to-list 'org-latex-packages-alist '("AUTO" "inputenc" t))

  (add-to-list 'org-latex-classes
               '("chinese"
                 "\\documentclass[UTF8]{ctexart}
        \\usepackage{amsmath,latexsym,amssymb,mathrsfs,pifont}
        \\usepackage[T1]{fontenc}
        \\usepackage{fixltx2e}
        \\usepackage{graphicx}
        \\usepackage{subfig}
        \\usepackage{grffile}
        \\usepackage{longtable}
        \\usepackage{wrapfig}
        \\usepackage{rotating}
         \\usepackage[colorlinks=true]{hyperref}
        \\tolerance=1000
        [NO-DEFAULT-PACKAGES]
        [NO-PACKAGES]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("koma" "\\documentclass{scrartcl}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("play" "\\documentclass{play}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("plari" "\\documentclass{plari}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("rtklage" "\\documentclass{rtklage}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("screenplay" "\\documentclass{screenplay}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("slides" "\\documentclass{slides}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("stage" "\\documentclass{stage}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("org-article"
                 "\\documentclass{org-article}
             [NO-DEFAULT-PACKAGES]
             [PACKAGES]
             [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
;; ;; minted
;; (setq org-latex-listings 'minted
;;       org-latex-packages-alist '(("" "minted"))
;;       org-latex-minted-options '(("frame" "lines") ("linenos") ("baselinestretch" "1.2"))
;;       org-latex-pdf-process
;;       '("%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "%latex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;; listings
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("AUTO" "inputenc") ("" "minted"))
      ;; minted options:
      ;; breaklines: automatically wrap long lines at space.
      ;; breakanywhere: break long lines not only at space.
      org-latex-minted-options '(("frame" "lines") ("linenos") ("baselinestretch" "1.2") ("breaklines"))
      org-latex-pdf-process
      '("%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "%latex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "%latex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; notmuch
(with-eval-after-load "notmuch"
  (add-to-list 'notmuch-saved-searches '(:name "read-it-later" :query "tag:read-it-later" :key "r"))
  (add-to-list 'notmuch-saved-searches '(:name "my-unread" :query "tag:unread and tag:interested" :key "m")))
;; fcitx
;; Make sure the following comes before `(fcitx-aggressive-setup)'
;; (fcitx-aggressive-setup)
;; (fcitx-prefix-keys-add "M-m") ; M-m is common in Spacemacs
;; (setq fcitx-use-dbus t) ; uncomment if you're using Linux

;; epa settings for asc file
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

;; org mode setting
(with-eval-after-load "org"
  (setq org-time-stamp-formats '("<%Y-%m-%d %a>" . "<%Y-%m-%d %a %H:%M %z>"))
  (add-to-list 'org-export-backends 'taskjuggler)
  (setq org-taskjuggler-default-reports '("include \"gantt.tji\"")))
(with-eval-after-load "ox-taskjuggler"
  (add-to-list 'org-taskjuggler-valid-task-attributes 'priority)
  (add-to-list 'org-taskjuggler-valid-task-attributes 'booking)
  (add-to-list 'org-taskjuggler-valid-project-attributes 'include)
  (add-to-list 'org-taskjuggler-valid-resource-attributes 'shifts)
  (setq org-taskjuggler-default-global-properties "include \"global-properties.tji\""))
(setq org-todo-keywords
      '((sequence "TODO(t!)" "WAITING(w!)" "NEXT(n!)" "INACTIVE(i!)" "|" "DONE(d!)" "ABORT(a@/!)")))
(setq org-todo-keyword-faces
      '(("NEXT"     . (:foreground "LightGreen" :weight bold))
        ("WAITING" . (:foreground "DeepSkyBlue" :weight bold))
        ("INACTIVE" . (:foreground "gray"))
        ("ABORT"    . (:background "gray" :foreground "black"))))
(setq org-directory "~/Dropbox/Documents/Important/org")
(setq org-agenda-files '("~/Dropbox/Documents/Important/org/"))
(setq org-columns-default-format "%25ITEM %TODO %3PRIORITY %10EFFORT{:} %10CLOCKSUM %22TIMESTAMP_IA %TAGS")
;; (setq org-columns-default-format "%25ITEM %TODO %3PRIORITY %10CLOCKSUM %22TIMESTAMP_IA %TAGS")
;; Define the custum capture templates
(setq org-capture-templates
      '(("t" "todo" entry (file "todo.org")
         "* TODO [#B] %?\nDEADLINE: %t\n%U\n" :clock-in t :clock-resume t :jump-to-captured t)
        ("r" "Read It Later" entry (file "todo.org")
         (file "~/Dropbox/Documents/Important/org/template/template-read-it-later.txt") :clock-in t :clock-resume t :jump-to-captured t)
        ("d" "Diary" entry (file+datetree "diary.org")
         "* %?\n%U\n" :clock-in t :clock-resume t)
        ("i" "Idea" entry (file "notes.org")
         "* %? :idea:\n%U\n" :clock-in t :clock-resume t :jump-to-captured t)))
(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))
(setq org-export-coding-system 'utf-8)
(setq org-stuck-projects '("+LEVEL=2/-DONE" ("TODO" "NEXT" "WAITING") nil ""))
