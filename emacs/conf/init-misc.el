(menu-bar-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)

(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

(require 'lcomp)
(lcomp-install)