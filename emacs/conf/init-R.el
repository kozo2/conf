(load "~/projects/ESS/lisp/ess-site")

;(require 'anything-R)

(add-hook 'inferior-ess-mode-hook
          (function
           (lambda ()
	     (local-set-key "\C-p" 'comint-previous-input)
	     (local-set-key "\C-n" 'comint-next-input)
	     (local-set-key "\C-r" 'comint-history-isearch-backward-regexp)
	     (local-set-key "\C-k" 'kill-line)
	     (local-set-key "\C-j" 'ess-smart-underscore)
;	     (local-set-key "\C-cr" 'anything-for-R)
             )))

(add-hook 'ess-help-mode-hook
	  (function
	   (lambda ()
	     (local-set-key "j" 'ess-skip-to-next-section)
	     (local-set-key "k" 'ess-skip-to-previous-section)
	     )))

(add-hook 'ess-mode-hook
          (function
           (lambda ()
	     (local-set-key "\C-a" 'back-to-indentation)
;	     (local-set-key "\C-cr" 'anything-for-R)
             )))
