(eval-after-load 'evil-vimish-fold
  '(progn
     (evil-define-motion evil-vimish-fold/next-fold (count)
       "Go to the start of the next fold."
       :type inclusive
       (when vimish-fold-mode
         (if count
             (dotimes (_ count nil)
               (vimish-fold-next-fold))
           (vimish-fold-next-fold))))
     (evil-define-motion evil-vimish-fold/previous-fold (count)
       "Go to the start of the previous fold."
       :type inclusive
       (when vimish-fold-mode
         (if count
             (dotimes (_ count nil)
               (vimish-fold-previous-fold))
           (vimish-fold-previous-fold))))))
