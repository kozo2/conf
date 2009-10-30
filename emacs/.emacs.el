;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

;; http://d.hatena.ne.jp/kazu-yamamoto/20080219/1203423707
(defun my-load-path (path)
  (let ((epath (expand-file-name path)))
    (unless (member epath load-path)
      (setq load-path (cons epath load-path)))))

(my-load-path "~/.emacs.d/conf")
(my-load-path "~/.emacs.d/elisp")

;(require 'install-elisp)
;(setq install-elisp-repository-directory "~/.emacs.d/elisp/")
;(require 'auto-install)
;(setq auto-install-directory "~/.emacs.d/auto-install/")

;; (install-elisp-from-emacswiki "anything.el")
;; (install-elisp-from-emacswiki "anything-config.el")
;; (install-elisp-from-emacswiki "anything-match-plugin.el")
;; (install-elisp-from-emacswiki "anything-etags.el")
;; (install-elisp-from-emacswiki "auto-install.el")
;; (install-elisp-from-emacswiki "browse-kill-ring.el")
;; (install-elisp-from-emacswiki "color-moccur.el")
;; (install-elisp-from-emacswiki "grep-edit.el")

(load "init-R")
;(load "init-anything")
;(load "init-buffer")
(load "init-completion")
;(load "init-develock")
(load "init-dired")
(load "init-elisp")
(load "init-function")
(load "init-highlight")
;(load "init-history")
(load "init-key")
;(load "init-lang")
;(load "init-misc")
;(load "init-register")
(load "init-save")
;(load "init-search")
;(load "init-text")

;; http://www.hasta-pronto.org/archives/2007/01/08-0259.php
(cond
 ((string-match "apple-darwin" system-configuration)
  (load "init-gui")
  (load "init-locale")
  (load "init-mac")
;;   (load "init-skk")
  )
 ((string-match "linux" system-configuration)
  (load "init-locale")
  )
 ((string-match "mingw" system-configuration)
  (load "init-gui")
  (load "init-windows")
  )
 )

