(add-hook 'emacs-lisp-mode-hook
          (function
           (lambda ()
             (local-set-key "\"" 'electric-pair)
             (local-set-key "(" 'electric-pair)
             (local-set-key "{" 'electric-pair)
             (local-set-key "\C-c\C-n" 'describe-function)
             (local-set-key "\C-c\C-v" 'describe-variable)
             )))

(add-hook 'lisp-interaction-mode-hook
          (function
           (lambda ()
             (local-set-key "\"" 'electric-pair)
             (local-set-key "(" 'electric-pair)
             (local-set-key "{" 'electric-pair)
             (local-set-key "\C-c\C-n" 'describe-function)
             (local-set-key "\C-c\C-v" 'describe-variable)
             )))

;; (install-elisp "http://www.geocities.co.jp/SiliconValley-Oakland/7673/lisp/lcomp.el")
