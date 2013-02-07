;;;; set
;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

(set-language-environment "Japanese")
;(set-language-environment "UTF-8")
(setq dired-dwim-target t)
(setq debug-on-error t)
;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq dabbrev-case-fold-search nil)
(setq dabbrev-case-replace nil)
(setq gc-cons-threshold (* 10 gc-cons-threshold))
(setq message-log-max 10000)
(setq enable-recursive-minibuffers t)
(setq use-dialog-box nil)
(setq history-length 1000)
(setq echo-keystrokes 0.1)
(setq large-file-warning-threshold (* 25 1024 1024))
(setq make-backup-files nil)
(setq line-move-visual nil)
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(delete (assoc 'which-func-mode mode-line-format) mode-line-format)
(setq-default header-line-format '(which-func-mode ("" which-func-format)))

;;;; def
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))
(defalias 'message-box 'message)
(defalias 'yes-or-no-p 'y-or-n-p)
;(fset 'yes-or-no-p 'y-or-n-p)
(defalias 'qrr 'query-replace-regexp)

;;;; mode
(scroll-bar-mode 0)
(global-auto-revert-mode 1)
(winner-mode 1)
(recentf-mode 1)

(windmove-default-keybindings)

(global-hl-line-mode 1)
;(set-face-background 'hl-line "darkolivegreen")
(savehist-mode 1)
(show-paren-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(transient-mark-mode 1)
(which-func-mode 1)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(display-time)

;;;; global remap
(global-set-key (kbd "C-u") 'helm-M-x)
(global-set-key (kbd "C-r") 'helm-mini)

;;;; addon
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(helm-mode 1)

(elscreen-start)

(require 'auto-complete-config)
(ac-config-default)

(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))

(evil-mode 1) 
(define-key evil-normal-state-map " " 'dired-jump)
(define-key evil-normal-state-map ";" 'evil-ex)
(define-key evil-normal-state-map "\C-n" 'helm-mini)
(define-key evil-insert-state-map "\C-h" 'delete-backward-char)
(define-key evil-insert-state-map "\C-j" 'tcode-activate-input-method)
(define-key evil-insert-state-map "\C-l" 'evil-normal-state)
(define-key evil-insert-state-map "\C-k" 'tcode-inactivate-input-method-recenter)

(setq load-path (cons "~/.emacs.d/tc3/lisp" load-path))
(setq tcode-load-immediate t)
(defun tcode-activate-input-method ()
  (interactive)
  (activate-input-method default-input-method))
(defun tcode-inactivate-input-method ()
  (interactive)
  (inactivate-input-method))
(defun tcode-inactivate-input-method-recenter ()
  (interactive)
  (inactivate-input-method)
  (recenter-top-bottom))
(define-key global-map "\C-j" 'tcode-activate-input-method)
(define-key global-map "\C-l" 'tcode-inactivate-input-method-recenter)
(define-key global-map "\C-\\" 'tcode-inactivate-input-method)
(require 'tc-setup)
;(load "tc-setup")
