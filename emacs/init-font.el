;; http://www.hasta-pronto.org/archives/2007/01/08-0259.php
(cond
 ((string-match "i386-apple-darwin9.8.0" system-configuration)

  )
 ((string-match "amd64-portbld-freebsd8.0" system-configuration)

  )
 ((string-match "x86_64-pc-linux-gnu" system-configuration)

  )
 ((string-match "i386-mingw-nt6.1.7601" system-configuration)

  (set-default-font "Consolas 14")
  (set-fontset-font (frame-parameter nil 'font)
		    'japanese-jisx0208
		    '("IPAゴシック" . "unicode-bmp")
		    )
  (set-fontset-font (frame-parameter nil 'font)
		    'katakana-jisx0201
		    '("IPAゴシック" . "unicode-bmp")
		    )
  
  ;; (set-face-attribute 'default nil
  ;; 		      :family "IPAゴシック"
  ;; 		      :height 140)
  ;; (set-fontset-font "fontset-default"
  ;; 		    'japanese-jisx0208
  ;; 		    '("IPAゴシック" . "jisx0208-sjis"))
  
  )
 )
