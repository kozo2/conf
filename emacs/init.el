;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/projects/conf/emacs/conf/")
(add-to-list 'load-path "~/projects/emacswiki.org/" t)

(require 'auto-install)
(require 'anything-startup)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

(load "init-buffer")
(load "init-cursor")
(load "init-elisp")
(load "init-externalprogram")
(load "init-function")
(load "init-highlight")
(load "init-inputsupport")
(load "init-key")
(load "init-moreconvenient")
(load "init-search")
(load "init-R")

;; http://www.hasta-pronto.org/archives/2007/01/08-0259.php
(cond
 ((string-match "x86_64-apple-darwin10.4.1" system-configuration)

  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))

  ;; http://sakito.jp/emacs/emacs23.html
  (when (>= emacs-major-version 23)
    (set-face-attribute 'default nil
			:family "monaco"
			:height 140)
    (set-fontset-font
     (frame-parameter nil 'font)
     'japanese-jisx0208
     '("Hiragino Maru Gothic Pro" . "iso10646-1"))
    (set-fontset-font
     (frame-parameter nil 'font)
     'japanese-jisx0212
     '("Hiragino Maru Gothic Pro" . "iso10646-1"))
    (set-fontset-font
     (frame-parameter nil 'font)
     'mule-unicode-0100-24ff
     '("monaco" . "iso10646-1"))
    (setq face-font-rescale-alist
	  '(("^-apple-hiragino.*" . 1.2)
	    (".*osaka-bold.*" . 1.2)
	    (".*osaka-medium.*" . 1.2)
	    (".*courier-bold-.*-mac-roman" . 1.0)
	    (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
	    (".*monaco-bold-.*-mac-roman" . 0.9)
	    ("-cdac$" . 1.3))))

  )
 ((string-match "amd64-portbld-freebsd8.0" system-configuration)
  (load "init-misc")
  )
 ((string-match "x86_64-pc-linux-gnu" system-configuration)
  (load "init-ruby")
  )
 ((string-match "i386-mingw-nt6.1.7600" system-configuration)
  ;; http://ess.r-project.org/Manual/readme.html#Installation
  (load "init-tcode")

  (set-face-attribute 'default nil
		      :family "Consolas"
		      :height 140)
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "ＭＳ ゴシック"))
  (setq face-font-rescale-alist
	'((".*Consolas.*" . 1.0)
	  (".*ＭＳ ゴシック.*" . 1.1)
	 ;("-cdac$" . 1.3)
	  ))

  )
 )


(savehist-mode 1)
(setq-default save-place t)
(require 'saveplace)
(show-paren-mode 1)
(display-time)
(line-number-mode 1)
(column-number-mode 1)
(tool-bar-mode nil)
(scroll-bar-mode nil)
(setq load-path (cons "~/.emacs.d/lisp/" load-path))
(require 'tc-setup)
