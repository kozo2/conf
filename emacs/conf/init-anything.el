;; (require 'anything-startup)

(global-set-key (kbd "C-;") 'anything)

(define-key anything-map "\C-\M-p" 'anything-previous-source)
(define-key anything-map "\C-\M-n" 'anything-next-source)

;; (anything-complete-shell-history-setup-key (kbd "C-o"))
;; (global-set-key (kbd "M-y") 'anything-show-kill-ring)
;; (global-set-key (kbd "C-x b") 'anything-for-files)
;; (setq descbinds-anything-window-style 'split-window)