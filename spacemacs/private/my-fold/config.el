(eval-after-load 'vimish-fold '(vimish-fold-global-mode 1))
(eval-after-load 'evil-vimish-fold '(evil-vimish-fold-mode 1))
(eval-after-load 'origami
  '(progn
     (add-to-list 'origami-parser-alist '(python-mode . origami-indent-parser))))
