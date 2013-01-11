;; (require 'package)
;; (package-initialize)

(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode 1)
(add-to-list 'ac-dictionary-directories "~/projects/auto-complete/dict/")
(setq ac-use-menu-map t)
(defun emacs-lisp-ac-setup ()
  (setq ac-source '(ac-source-words-in-same-mode-buffers ac-source-words-in-same-mode-buffers)))

(require 'e2wm)

(require 'bf-mode)
;; list up file extensions which should be excepted
(setq bf-mode-except-exts
      (append '("\\.dump$" "\\.data$" "\\.mp3$" "\\.lnk$")
	      bf-mode-except-exts))
;; list up file extensions which should be forced browsing
(setq bf-mode-force-browse-exts
      (append '("\\.txt$" "\\.and.more...")
	      bf-mode-force-browse-exts))
;; browsable file size maximum
(setq bf-mode-browsing-size 100) ;; 100 killo bytes
;; browsing htmls with w3m (needs emacs-w3m.el and w3m)
(setq bf-mode-html-with-w3m t)
;; browsing archive file (contents listing) verbosely
(setq bf-mode-archive-list-verbose t)
;; browing directory (file listing) verbosely
;;(setq bf-mode-directory-list-verbose t)
;; start bf-mode immediately after starting dired
;;(setq bf-mode-enable-at-starting-dired t)
;; quitting dired directly from bf-mode
(setq bf-mode-directly-quit t)

;; (require 'popwin)
;; (setq display-buffer-function 'popwin:display-buffer)
;; (setq popwin:special-display-config '(("*scratch*")))
;; (display-buffer "*scratch*")
;; (setq anything-samewindow nil)
;; (push '("*anything*" :height 20) popwin:special-display-config)
;; (push '(dired-mode :position top) popwin:special-display-config)

(require 'smartchr)

(require 'tc-setup)
(setq tcode-adjust-window-for-help t)

(require 'color-moccur)
(setq moccur-split-word t)

(require 'moccur-edit)
(setq moccur-split-word t)

(require 'grep-edit)

(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/projects/yasnippet-read-only/snippets/")

;; (require 'recentf-ext)
;; (global-set-key (kbd "C-x C-;") 'recentf-open-files)

;; (require 'point-undo)
;; (define-key global-map (kbd "<f7>") 'point-undo)
;; (define-key global-map (kbd "S-<f7>") 'point-redo)

;; (require 'goto-chg)
;; (define-key global-map (kbd "<f8>") 'goto-last-change)
;; (define-key global-map (kbd "S-<f8>") 'goto-last-change-reverse)

;; (require 'eldoc-extension)

;; (require 'shell-history)

;; (require 'redo+)
;; (global-set-key (kbd "C-M-/") 'redo)
;; (setq undo-no-redo t)
;; (setq undo-limit 600000)
;; (setq undo-strong-limit 900000)

;; (require 'igrep)
;; (igrep-define lgrep (igrep-use-zgrep nil)(igrep-regex-option "-n -0u8"))
;; (igrep-find-define lgrep (igrep-use-zgrep nil)(igrep-regex-option "-n -0u8"))

;; (require 'grep-a-lot)
;; (grep-a-lot-setup-keys)
;; (grep-a-lot-advise igrep)

;; (require 'lcomp)
;; (lcomp-mode 1)
;; (lcomp-keys-mode 1)
;; (lcomp-install)

;; (require 'summarye)
