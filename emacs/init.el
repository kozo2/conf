;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/projects/conf/emacs/conf/")
(add-to-list 'load-path "~/projects/emacswikipages/" t)

(require 'auto-install)
(require 'anything-startup)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

(load "init-completion")
(load "init-dired")
(load "init-elisp")
(load "init-function")
(load "init-gui")
(load "init-highlight")
(load "init-key")
(load "init-search")
(load "init-R")

;; http://www.hasta-pronto.org/archives/2007/01/08-0259.php
(cond
 ((string-match "i386-apple-darwin9.8.0" system-configuration)
  (require 'ess-site)
  (load "init-gui")
  (load "init-mac")
  )
 ((string-match "amd64-portbld-freebsd8.0" system-configuration)
  (load "init-misc")
  )
 ((string-match "x86_64-pc-linux-gnu" system-configuration)
  (load "init-gui")
  (load "init-ruby")
  )
 ((string-match "i386-mingw-nt6.1.7600" system-configuration)
  ;; http://ess.r-project.org/Manual/readme.html#Installation
  (load "~/projects/ESS/lisp/ess-site")
  (load "init-gui")
  (load "init-tcode")

  (set-face-attribute 'default nil
		      :family "Consolas"
		      :height 140)
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "ÇlÇr ÉSÉVÉbÉN"))
  (setq face-font-rescale-alist
	'((".*Consolas.*" . 1.0)
	  (".*ÇlÇr ÉSÉVÉbÉN.*" . 1.1)
	 ;("-cdac$" . 1.3)
	  ))

  )
 )
