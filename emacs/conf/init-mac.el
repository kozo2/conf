(if (eq window-system 'mac) (require 'carbon-font))
(fixed-width-set-fontset "osaka" 14)

(defun my-mac-toggle-max-window ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

(global-set-key "\C-w\C-m" 'my-mac-toggle-max-window)
