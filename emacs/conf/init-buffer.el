(setq make-backup-files nil)
(fset 'yes-or-no-p 'y-or-n-p)

(ffap-bindings)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

(setq recentf-max-saved-items 1024)
(require 'recentf-ext)

(require 'dired-x)
(require 'wdired)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

(add-hook 'dired-mode-hook
          (function
           (lambda ()
             (local-set-key "s" 'vc-dir)
             (local-set-key ";" 'dired-up-directory)
             (local-set-key "j" 'dired-next-line)
             (local-set-key "k" 'dired-previous-line)
             (local-set-key "q" 'kill-this-buffer)
             )))
