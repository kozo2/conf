;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

(set-language-environment "Japanese")
;(set-language-environment "UTF-8")

;(add-to-list 'load-path (expand-file-name "~/elisp/"))
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(add-to-list 'load-path "~/projects/conf/emacs/")
(add-to-list 'load-path "~/share/emacs/site-lisp/tc/")
(add-to-list 'load-path "~/projects/yasnippet-read-only/")
(add-to-list 'load-path "~/projects/auto-complete/")
(add-to-list 'load-path "~/projects/magit/")
(add-to-list 'load-path "~/projects/emacs-window-manager/")

(global-hl-line-mode 1)
;(set-face-background 'hl-line "darkolivegreen")
(savehist-mode 1)
(show-paren-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(transient-mark-mode 1)
(menu-bar-mode -1)
(which-func-mode 1)

(display-time)

;; default to better frame titles
(setq debug-on-error t)
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

(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))

(defalias 'message-box 'message)
(defalias 'yes-or-no-p 'y-or-n-p)
;(fset 'yes-or-no-p 'y-or-n-p)
(defalias 'qrr 'query-replace-regexp)

(load "init-included")
(load "init-additional")
(load "init-function")
(load "init-keybind")
(load "init-program")
(load "init-hook")
(load "init-font")
