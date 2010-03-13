;; http://ess.r-project.org/Manual/readme.html#Installation
(load "~/.emacs.d/elisp/ess/lisp/ess-site")

(add-hook 'inferior-ess-mode-hook
          (function
           (lambda ()
             (local-set-key "\"" 'electric-pair)
             (local-set-key "\'" 'electric-pair)
             (local-set-key "(" 'electric-pair)
             (local-set-key "[" 'electric-pair)
             (local-set-key "{" 'electric-pair)
             (local-set-key (kbd ",") (my-chr '(", " ",")))
             (local-set-key (kbd "=") (my-chr '(" = " "=")))
             )))

(add-hook 'ess-mode-hook
          (function
           (lambda ()
             (local-set-key "\"" 'electric-pair)
             (local-set-key "\'" 'electric-pair)
             (local-set-key "(" 'electric-pair)
             (local-set-key "[" 'electric-pair)
             (local-set-key "{" 'electric-pair)
             (local-set-key (kbd ",") (my-chr '(", " ",")))
             (local-set-key (kbd "=") (my-chr '(" = " "=")))
             )))

