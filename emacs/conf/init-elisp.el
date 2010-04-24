(require 'install-elisp)

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

;; (install-elisp-from-emacswiki "anything-complete.el")
;; (install-elisp "http://www.bookshelf.jp/elc/moccur-edit.el")
;; (install-elisp "http://www.cx4a.org/pub/auto-complete.el")
;; (install-elisp "http://svn.coderepos.org/share/lang/elisp/anything-c-moccur/trunk/anything-c-moccur.el")
