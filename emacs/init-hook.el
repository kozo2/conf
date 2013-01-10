(add-hook 'dired-mode-hook
          (function
           (lambda ()
             (local-set-key "s" 'vc-dir)
             (local-set-key ";" 'dired-up-directory)
             (local-set-key "j" 'dired-next-line)
             (local-set-key "k" 'dired-previous-line)
             (local-set-key "q" 'kill-this-buffer)
	     (local-set-key "\C-n" 'anything)
	     (local-set-key "\C-t" 'other-window-or-split)
             )))

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook ' turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook
          (function
           (lambda ()
             (local-set-key "\C-c\C-d" 'describe-function)
             (local-set-key "\C-c\C-v" 'describe-variable)
             )))
(add-hook 'lisp-interaction-mode-hook
          (function
           (lambda ()
	     (local-set-key "\C-c\C-j" 'eval-print-last-sexp)
	     (local-set-key "\C-c\C-d" 'describe-function)
             (local-set-key "\C-c\C-v" 'describe-variable)
             )))

(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-ac-setup)
