
(load "init-anything")
(load "init-completion")
(load "init-dired")
(load "init-elisp")
(load "init-function")
(load "init-highlight")
(load "init-key")
(load "init-misc")
(load "init-save")
(load "init-search")

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
  (load "init-gui")
  (load "init-windows")
  )
 )

(load "init-R")
