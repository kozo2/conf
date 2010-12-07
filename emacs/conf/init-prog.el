(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%Y-%m-%d-%H%M%S.")

(require 'summarye)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(which-func-mode 1)
(setq which-func-modes t)
(delete (assoc 'which-func-mode mode-line-format) mode-line-format)
(setq-default header-line-format '(which-func-mode ("" which-func-format)))

;;; Python

(require 'popup)

(defun py-doc-exec ()
  (interactive)
  (save-current-buffer
    (let ((symbol
           (with-syntax-table python-dotty-syntax-table (current-word)))
          (tmpbuf (get-buffer-create "*py-doc-popup*"))
          (enable-recursive-minibuffers t))
      (if (equal symbol "") (error "No symbol"))
      (set-buffer "*py-doc-popup*")
      (comint-redirect-send-command-to-process
       (format "emacs.ehelp(%S, %s)"
               symbol python-imports) "*py-doc-popup*" (python-proc) nil t))))

(defun py-doc-popup ()
  "Get help() for object at point, and display it in a popup."
  ;; Note that we do this in the inferior process, not a separate one, to
  ;; ensure the environment is appropriate.
  (interactive)
  (py-doc-exec)
  (let ((curbuf (current-buffer)))
    (set-buffer "*py-doc-popup*")
    (let ((bs (buffer-string)))
      (set-buffer curbuf)
      (popup-tip bs))
    (kill-buffer "*py-doc-popup*")))

(add-hook 'python-mode-hook 
	  (function
	   (lambda ()
	     (local-set-key "\C-cp" 'py-doc-popup)
	     (local-set-key (kbd "'") (smartchr '("'`!!''" "'")))
	     (make-local-variable 'ac-ignores)
	     (add-to-list 'ac-ignores "for")
	     )))

;;; Ruby

;; note that you need to have font lock enabled beforehand.
;(require 'ruby-electric)

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
    				     interpreter-mode-alist))

(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (inf-ruby-keys)
	     (ruby-electric-mode t)
	     ))
