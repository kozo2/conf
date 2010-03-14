;;;; -*- mode: emacs-lisp; coding: iso-2022-7bit -*-
;;;;
;;;; Copyright (C) 2001 The Meadow Team

;; Author: Koichiro Ohba <koichiro@meadowy.org>
;;      Kyotaro HORIGUCHI <horiguti@meadowy.org>
;;      Hideyuki SHIRAI <shirai@meadowy.org>
;;      KOSEKI Yoshinori <kose@meadowy.org>
;;      and The Meadow Team.


;; ;;; Mule-UCS の設定
;; ;; ftp://ftp.m17n.org/pub/mule/Mule-UCS/ が オフィシャルサイトですが、
;; ;; http://www.meadowy.org/~shirai/elisp/mule-ucs.tar.gz に既知のパッチ
;; ;; をすべて適用したものがおいてあります。
;; ;; (set-language-environment) の前に設定します
;; (require 'jisx0213)


;;; 日本語環境設定
(set-language-environment "Japanese")


;;; IMEの設定
(mw32-ime-initialize)
(setq default-input-method "MW32-IME")
(setq-default mw32-ime-mode-line-state-indicator "[--]")
(setq mw32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
(add-hook 'mw32-ime-on-hook
	  (function (lambda () (set-cursor-height 2))))
(add-hook 'mw32-ime-off-hook
	  (function (lambda () (set-cursor-height 4))))


;; ;;; カーソルの設定
;; ;; (set-cursor-type 'box)            ; Meadow-1.10互換 (SKK等で色が変る設定)
;; ;; (set-cursor-type 'hairline-caret) ; 縦棒キャレット


;;; マウスカーソルを消す設定
(setq w32-hide-mouse-on-key t)
(setq w32-hide-mouse-timeout 5000)


;; ;;; TrueType フォント設定
;; (w32-add-font
;;  "private-fontset"
;;  '((spec
;;     ((:char-spec ascii :height 120)
;;      strict
;;      (w32-logfont "Courier New" 0 -13 400 0 nil nil nil 0 1 3 49))
;;     ((:char-spec ascii :height 120 :weight bold)
;;      strict
;;      (w32-logfont "Courier New" 0 -13 700 0 nil nil nil 0 1 3 49))
;;     ((:char-spec ascii :height 120 :slant italic)
;;      strict
;;      (w32-logfont "Courier New" 0 -13 400 0   t nil nil 0 1 3 49))
;;     ((:char-spec ascii :height 120 :weight bold :slant italic)
;;      strict
;;      (w32-logfont "Courier New" 0 -13 700 0   t nil nil 0 1 3 49))
;;     ((:char-spec japanese-jisx0208 :height 120)
;;      strict
;;      (w32-logfont "ＭＳ ゴシック" 0 -16 400 0 nil nil nil 128 1 3 49))
;;     ((:char-spec japanese-jisx0208 :height 120 :weight bold)
;;      strict
;;      (w32-logfont "ＭＳ ゴシック" 0 -16 700 0 nil nil nil 128 1 3 49)
;;      ((spacing . -1)))
;;     ((:char-spec japanese-jisx0208 :height 120 :slant italic)
;;      strict
;;      (w32-logfont "ＭＳ ゴシック" 0 -16 400 0   t nil nil 128 1 3 49))
;;     ((:char-spec japanese-jisx0208 :height 120 :weight bold :slant italic)
;;      strict
;;      (w32-logfont "ＭＳ ゴシック" 0 -16 700 0   t nil nil 128 1 3 49)
;;      ((spacing . -1))))))

;; (set-face-attribute 'variable-pitch nil :family "*")


;; ;;; BDF フォント設定
;;
;; ;;; (方法その1) Netinstall パッケージを使う方法
;; ;;; misc と intlfonts パッケージを入れます。
;; ;;; .emacsの設定
;; (setq bdf-use-intlfonts16 t)
;; (setq initial-frame-alist '((font . "intlfonts16")))
;;
;; ;;; (方法その1') 
;; ;;; intlfonts-file-16dot-alist の形式で bdf-fontset-alist を書き、
;; ;;; 次を設定すれば良い。
;; ;;;  (require 'bdf)
;; ;;;  (bdf-configure-fontset "bdf-fontset" bdf-fontset-alist)
;; ;;; 詳細は $MEADOW/pkginfo/auto-autoloads.el と $MEADOW/site-lisp/bdf.el を
;; ;;; 参照のこと。
;;
;; ;;; (方法その2) 
;; ;;; フォントの指定方法は次のサンプルを参考にする。
;; ;;; normal, bold, italic, bold-itaric フォントを指定する必要あり。
;; (setq bdf-font-directory "c:/Meadow/fonts/intlfonts/")
;; (w32-add-font "bdf-fontset"
;; `((spec 
;;    ;; ascii
;;    ((:char-spec ascii :height any :weight normal :slant normal)
;;     strict (bdf-font ,(expand-file-name "lt1-16-etl.bdf" bdf-font-directory)))
;;    ((:char-spec ascii :height any :weight bold :slant normal)
;;     strict (bdf-font ,(expand-file-name "lt1-16b-etl.bdf" bdf-font-directory)))
;;    ((:char-spec ascii :height any :weight normal :slant any)
;;     strict (bdf-font ,(expand-file-name "lt1-16i-etl.bdf" bdf-font-directory)))
;;    ((:char-spec ascii :height any :weight bold :slant any)
;;     strict (bdf-font ,(expand-file-name "lt1-16bi-etl.bdf" bdf-font-directory)))
;;    ;; katakana-jisx0201
;;    ((:char-spec katakana-jisx0201 :height any :weight normal :slant normal)
;;     strict (bdf-font ,(expand-file-name "8x16rk.bdf" bdf-font-directory))
;;     ((encoding . 1-byte-set-msb))) 
;;    ((:char-spec katakana-jisx0201 :height any :weight bold :slant normal)
;;     strict (bdf-font ,(expand-file-name "8x16rk.bdf" bdf-font-directory))
;;     ((encoding . 1-byte-set-msb))) 
;;    ((:char-spec katakana-jisx0201 :height any :weight normal :slant any)
;;     strict (bdf-font ,(expand-file-name "8x16rk.bdf" bdf-font-directory))
;;     ((encoding . 1-byte-set-msb))) 
;;    ((:char-spec katakana-jisx0201 :height any :weight bold :slant any)
;;     strict (bdf-font ,(expand-file-name "8x16rk.bdf" bdf-font-directory))
;;     ((encoding . 1-byte-set-msb)))
;;    ;; latin-jisx0201
;;    ((:char-spec latin-jisx0201 :height any :weight normal :slant normal)
;;     strict (bdf-font ,(expand-file-name "8x16rk.bdf" bdf-font-directory)))
;;    ((:char-spec latin-jisx0201 :height any :weight bold :slant normal)
;;     strict (bdf-font ,(expand-file-name "8x16rk.bdf" bdf-font-directory)))
;;    ((:char-spec latin-jisx0201 :height any :weight normal :slant any) 
;;     strict (bdf-font ,(expand-file-name "8x16rk.bdf" bdf-font-directory))) 
;;    ((:char-spec latin-jisx0201 :height any :weight bold :slant any) 
;;     strict (bdf-font ,(expand-file-name "8x16rk.bdf" bdf-font-directory)))
;;    ;; japanese-jisx0208
;;    ((:char-spec japanese-jisx0208 :height any :weight normal :slant normal) 
;;     strict (bdf-font ,(expand-file-name "j90-16.bdf" bdf-font-directory)))
;;    ((:char-spec japanese-jisx0208 :height any :weight bold :slant normal)
;;     strict (bdf-font ,(expand-file-name "j90-16.bdf" bdf-font-directory))) 
;;    ((:char-spec japanese-jisx0208 :height any :weight normal :slant any)
;;     strict (bdf-font ,(expand-file-name "j90-16.bdf" bdf-font-directory)))
;;    ((:char-spec japanese-jisx0208 :height any :weight bold :slant any)
;;     strict (bdf-font ,(expand-file-name "j90-16b.bdf" bdf-font-directory))))))

;; 初期フレームの設定
(setq default-frame-alist
      (append (list
;; 	       '(foreground-color . "black")
;; 	       '(background-color . "LemonChiffon")
;; 	       '(background-color . "gray")
;; 	       '(border-color . "black")
;; 	       '(mouse-color . "white")
;; 	       '(cursor-color . "black")
;;             '(ime-font . (w32-logfont "ＭＳ ゴシック"
;;		      0 16 400 0 nil nil nil
;;		      128 1 3 49)) ; TrueType のみ
;;	       '(font . "bdf-fontset")    ; BDF
;;	       '(font . "private-fontset"); TrueType
	       '(width . 80)
	       '(height . 40)
	       '(line-spacing . 4)
	       '(top . 100)
	       '(left . 100)
	       )
	      default-frame-alist))


;; ;;; shell の設定

;;; Cygwin の bash を使う場合
(setq explicit-shell-file-name "bash")
(setq shell-file-name "sh")
(setq shell-command-switch "-c") 

;; ;;; Virtually UN*X!にある tcsh.exe を使う場合
;; (setq explicit-shell-file-name "tcsh.exe") 
;; (setq shell-file-name "tcsh.exe") 
;; (setq shell-command-switch "-c") 

;; ;;; WindowsNT に付属の CMD.EXE を使う場合。
;; (setq explicit-shell-file-name "CMD.EXE") 
;; (setq shell-file-name "CMD.EXE") 
;; (setq shell-command-switch "\\/c") 


;;; argument-editing の設定
(require 'mw32script)
(mw32script-init)


;; ;;; browse-url の設定
;; (global-set-key [S-mouse-2] 'browse-url-at-mouse)


;; ;;; 印刷の設定
;; ;; この設定で M-x print-buffer RET などでの印刷ができるようになります
;; ;;
;; ;;  notepad に与えるパラメータの形式の設定
;; (define-process-argument-editing "notepad"
;;   (lambda (x) (general-process-argument-editing-function x nil t)))
;;
;; (defun w32-print-region (start end
;; 				  &optional lpr-prog delete-text buf display
;; 				  &rest rest)
;;   (interactive)
;;   (let ((tmpfile (convert-standard-filename (buffer-name)))
;; 	   (w32-start-process-show-window t)
;; 	   ;; もし、dos 窓が見えていやな人は上記の `t' を `nil' にします
;; 	   ;; ただし、`nil' にすると Meadow が固まる環境もあるかもしれません
;; 	   (coding-system-for-write w32-system-coding-system))
;;     (while (string-match "[/\\]" tmpfile)
;; 	 (setq tmpfile (replace-match "_" t nil tmpfile)))
;;     (setq tmpfile (expand-file-name (concat "_" tmpfile "_")
;; 				       temporary-file-directory))
;;     (write-region start end tmpfile nil 'nomsg)
;;     (call-process "notepad" nil nil nil "/p" tmpfile)
;;     (and (file-readable-p tmpfile) (file-writable-p tmpfile)
;; 	    (delete-file tmpfile))))
;; 
;; (setq print-region-function 'w32-print-region)

;; ;;; fakecygpty の設定
;; ;; この設定で cygwin の仮想端末を要求するプログラムを Meadow から
;; ;; 扱えるようになります
;; (setq mw32-process-wrapper-alist
;;       '(("/\\(bash\\|tcsh\\|svn\\|ssh\\|gpg[esvk]?\\)\\.exe" .
;; 	  (nil . ("fakecygpty.exe" . set-process-connection-type-pty)))))

;;;
;;; end of file
;;;
