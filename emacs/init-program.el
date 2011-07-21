;;; R
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

;;; Python

;; (require 'popup)

;; (defun py-doc-exec ()
;;   (interactive)
;;   (save-current-buffer
;;     (let ((symbol
;;            (with-syntax-table python-dotty-syntax-table (current-word)))
;;           (tmpbuf (get-buffer-create "*py-doc-popup*"))
;;           (enable-recursive-minibuffers t))
;;       (if (equal symbol "") (error "No symbol"))
;;       (set-buffer "*py-doc-popup*")
;;       (comint-redirect-send-command-to-process
;;        (format "emacs.ehelp(%S, %s)"
;;                symbol python-imports) "*py-doc-popup*" (python-proc) nil t))))

;; (defun py-doc-popup ()
;;   "Get help() for object at point, and display it in a popup."
;;   ;; Note that we do this in the inferior process, not a separate one, to
;;   ;; ensure the environment is appropriate.
;;   (interactive)
;;   (py-doc-exec)
;;   (let ((curbuf (current-buffer)))
;;     (set-buffer "*py-doc-popup*")
;;     (let ((bs (buffer-string)))
;;       (set-buffer curbuf)
;;       (popup-tip bs))
;;     (kill-buffer "*py-doc-popup*")))

;; (add-hook 'python-mode-hook 
;; 	  (function
;; 	   (lambda ()
;; 	     (local-set-key "\C-a" 'back-to-indentation)
;; 	     (local-set-key "\C-cp" 'py-doc-popup)
;; 	     (local-set-key (kbd "'") (smartchr '("'`!!''" "'")))
;; 	     (make-local-variable 'ac-ignores)
;; 	     (add-to-list 'ac-ignores "for")
;; 	     )))

;;; Ruby

;; note that you need to have font lock enabled beforehand.
;(require 'ruby-electric)

;; (autoload 'ruby-mode "ruby-mode"
;;   "Mode for editing ruby source files" t)
;; (setq auto-mode-alist
;;       (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
;; (setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
;;     				     interpreter-mode-alist))

;; (autoload 'run-ruby "inf-ruby"
;;   "Run an inferior Ruby process")
;; (autoload 'inf-ruby-keys "inf-ruby"
;;   "Set local key defs for inf-ruby in ruby-mode")
;; (add-hook 'ruby-mode-hook
;; 	  '(lambda ()
;; 	     (inf-ruby-keys)
;; 	     (ruby-electric-mode t)
;; 	     ))
