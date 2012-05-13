;; http://www.hasta-pronto.org/archives/2007/01/08-0259.php
(cond
 ((string-match "i386-apple-darwin9.8.0" system-configuration)

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
 ((string-match "x86_64-apple-darwin11.4.0" system-configuration)
  (set-default-font "Monaco 16")
  )
 ((string-match "x86_64-pc-linux-gnu" system-configuration)

  )
 ((string-match "i386-mingw-nt6.1.7601" system-configuration)

  (tool-bar-mode nil)
  (set-default-font "Consolas 14")
  (set-fontset-font (frame-parameter nil 'font)
		    'japanese-jisx0208
		    '("IPAÉSÉVÉbÉN" . "unicode-bmp")
		    )
  (set-fontset-font (frame-parameter nil 'font)
		    'katakana-jisx0201
		    '("IPAÉSÉVÉbÉN" . "unicode-bmp")
		    )

  ;; (set-face-attribute 'default nil
  ;;   	      :family "Consolas"
  ;;   	      :height 140)
  ;; (set-fontset-font
  ;;  nil 'japanese-jisx0208
  ;;  (font-spec :family "ÇlÇr ÉSÉVÉbÉN"))
  ;; (setq face-font-rescale-alist
  ;;   '((".*Consolas.*" . 1.0)
  ;;     (".*ÇlÇr ÉSÉVÉbÉN.*" . 1.1)
  ;;    ;("-cdac$" . 1.3)
  ;;     ))

  ;; (set-face-attribute 'default nil
  ;; 		      :family "IPAÉSÉVÉbÉN"
  ;; 		      :height 140)
  ;; (set-fontset-font "fontset-default"
  ;; 		    'japanese-jisx0208
  ;; 		    '("IPAÉSÉVÉbÉN" . "jisx0208-sjis"))
  
  )
 )
