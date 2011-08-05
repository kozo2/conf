;; (require 'package)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (package-initialize)

(require 'auto-install)

;; (auto-install-batch "anything")
;; (auto-install-batch "auto-complete development version")
;; (auto-install-from-url "https://raw.github.com/imakado/emacs-smartchr/master/smartchr.el")
;; (auto-install-from-url "http://www.bookshelf.jp/elc/bf-mode.el")
;; (auto-install-from-url "http://www.bookshelf.jp/elc/color-moccur.el")
;; (auto-install-from-url "http://www.bookshelf.jp/elc/moccur-edit.el")
;; (auto-install-from-url "http://www.bookshelf.jp/elc/grep-edit.el")

;; (auto-install-from-url "https://raw.github.com/m2ym/popwin-el/v0.3/popwin.el")

(require 'anything)
;; (require 'anything-startup)
;; (define-key anything-map "\C-\M-p" 'anything-previous-source)
;; (define-key anything-map "\C-\M-n" 'anything-next-source)
;; (anything-complete-shell-history-setup-key (kbd "C-o"))
;; (global-set-key (kbd "M-y") 'anything-show-kill-ring)
;; (global-set-key (kbd "C-x b") 'anything-for-files)
;; (setq descbinds-anything-window-style 'split-window)

(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode 1)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict/")
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-j" 'ac-next)
(define-key ac-menu-map "\C-k" 'ac-previous)
(defun emacs-lisp-ac-setup ()
  (setq ac-source '(ac-source-words-in-same-mode-buffers ac-source-words-in-same-mode-buffers)))
(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-ac-setup)

(require 'magit)

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
;; vim-like custom
(define-key bf-mode-map "j" 'bf-mode-next)
(define-key bf-mode-map "k" 'bf-mode-previous)
;; (define-key bf-mode-map "n" 'bf-mode-toggle-browse-alternative)
;;   (define-key bf-mode-map "h" 'bf-mode-change-heading)


;; (require 'popwin)
;; (setq display-buffer-function 'popwin:display-buffer)
;; (setq popwin:special-display-config '(("*scratch*")))
;; (display-buffer "*scratch*")
;; ;(setq anything-samewindow nil)
;; ;(push '("*anything*" :height 20) popwin:special-display-config)
;; (push '(dired-mode :position top) popwin:special-display-config)

(require 'smartchr)
(global-set-key (kbd "=") (smartchr '(" = " "=" " == ")))
(global-set-key (kbd "+") (smartchr '(" + " "+")))
(global-set-key (kbd "<") (smartchr '(" < " "<")))
(global-set-key (kbd ">") (smartchr '(" > " ">")))
(global-set-key (kbd ",") (smartchr '(", " ",")))
(global-set-key (kbd "\"") (smartchr '("\"`!!'\"" "\"\"`!!'" "\"")))
(global-set-key (kbd "(") (smartchr '("(`!!')" "()`!!'" "(")))
(global-set-key (kbd "[") (smartchr '("[`!!']" "[]`!!'" "[")))
(global-set-key (kbd "{") (smartchr '("{`!!'}" "{}`!!'" "{")))

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