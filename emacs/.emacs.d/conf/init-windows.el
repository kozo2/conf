(set-default-font "-outline-Consolas-normal-normal-normal-mono-19-*-*-*-c-*-iso8859-1")

(setq default-frame-alist
      (append (list
               '(width . 80)
               '(height . 30)
               '(top . 100)
               '(left . 100)
               '(line-spacing . 3)
               '(alpha . (85 60))
               )
              default-frame-alist)) 


;;; shell の設定
;;; Cygwin の bash を使う場合
(setq explicit-shell-file-name "bash")
(setq shell-file-name "sh")
(setq shell-command-switch "-c")
