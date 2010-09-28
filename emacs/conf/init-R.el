(load "~/projects/ESS/lisp/ess-site")

(add-hook 'inferior-ess-mode-hook
          (function
           (lambda ()
             (local-set-key "\"" 'electric-pair)
             (local-set-key "\'" 'electric-pair)
             (local-set-key "(" 'electric-pair)
             (local-set-key "[" 'electric-pair)
             (local-set-key "{" 'electric-pair)
	     (local-set-key "\C-j" 'ess-smart-underscore)
             )))

(add-hook 'ess-mode-hook
          (function
           (lambda ()
             (local-set-key "\"" 'electric-pair)
             (local-set-key "\'" 'electric-pair)
             (local-set-key "(" 'electric-pair)
             (local-set-key "[" 'electric-pair)
             (local-set-key "{" 'electric-pair)
	     (local-set-key "\C-j" 'ess-smart-underscore)
             )))
