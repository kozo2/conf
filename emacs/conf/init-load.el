;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

(load "init-R")
(load "init-anything")
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
 ((string-match "amd64-portbld-freebsd8.0" system-configuration)
  (load "init-misc")
  )
 ((string-match "linux" system-configuration)
  (load "init-gui")
  (load "init-anthy")
  )
 ((string-match "mingw" system-configuration)
  (load "init-gui")
  (load "init-windows")
  )
 )
