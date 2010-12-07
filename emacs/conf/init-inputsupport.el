(require 'redo+)
(global-set-key (kbd "C-M-/") 'redo)
(setq undo-no-redo t)
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

;;(global-set-key "\C-o" 'dabbrev-expand)
(global-set-key "\C-o" 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol
	))


(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode 1)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict/")

(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)


(defun emacs-lisp-ac-setup ()
  (setq ac-source '(ac-source-words-in-same-mode-buffers ac-source-words-in-same-mode-buffers)))
(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-ac-setup)

(add-to-list 'load-path
	     "~/projects/yasnippet-read-only")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/projects/yasnippet-read-only/snippets/")