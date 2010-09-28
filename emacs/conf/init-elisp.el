(require 'eldoc-extension)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook ' turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2)
(setq eldoc-minor-mode-string "")

(require 'usage-memo)
(setq umemo-base-directory "~/projects/conf/emacs/umemo")
(umemo-initialize)

(add-hook 'emacs-lisp-mode-hook
          (function
           (lambda ()
             (local-set-key "\"" 'electric-pair)
             (local-set-key "(" 'electric-pair)
             (local-set-key "{" 'electric-pair)
             (local-set-key "\C-c\C-d" 'describe-function)
             (local-set-key "\C-c\C-v" 'describe-variable)
             )))

(add-hook 'lisp-interaction-mode-hook
          (function
           (lambda ()
             (local-set-key "\"" 'electric-pair)
             (local-set-key "(" 'electric-pair)
             (local-set-key "{" 'electric-pair)
	     (local-set-key "\C-c\C-d" 'describe-function)
             (local-set-key "\C-c\C-v" 'describe-variable)
             )))
