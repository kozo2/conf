(require 'dired-x)
(require 'wdired)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; http://www-aos.eps.s.u-tokyo.ac.jp/~takagi/SubversionMemo.html#sec41
(add-hook 'dired-mode-hook
          (function
           (lambda ()
             (local-set-key "j" 'dired-next-line)
             (local-set-key "k" 'dired-previous-line)
             (local-set-key "q" 'kill-this-buffer)
             )))

