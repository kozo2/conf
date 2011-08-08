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

(require 'eldoc)
(setq eldoc-idle-delay 0.2)
(setq eldoc-minor-mode-string "")

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
