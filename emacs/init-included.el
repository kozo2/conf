(ffap-bindings)

;; (iswitchb-mode 1)
;; (setq read-buffer-function 'iswitchb-read-buffer)
;; (setq iswitchb-regexp nil)
;; (setq iswitchb-prompt-newbuffer nil)

;; (ido-mode 1)
;; (ido-everywhere 1)

;; (icomplete-mode t)

;; (partial-completion-mode t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

(require 'recentf)
(setq recentf-max-saved-items 1024)

(require 'saveplace)
(setq-default save-place t)

(require 'dired-x)
(require 'wdired)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
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

(require 'eldoc)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook ' turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2)
(setq eldoc-minor-mode-string "")
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

;;(global-set-key "\C-i" 'dabbrev-expand)
(global-set-key "\C-i" 'hippie-expand)
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
