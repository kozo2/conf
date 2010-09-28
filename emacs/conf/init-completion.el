;; http://d.hatena.ne.jp/khiker/20061220/1166643421
;(setq completion-ignore-case t)
;(setq read-file-name-completion-ignore-case t)
;(partial-completion-mode t)
;(icomplete-mode t)
;(setq dabbrev-case-fold-search nil)
;(setq dabbrev-case-replace nil)

;; http://cx4a.org/software/auto-complete/manual.ja.html
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;(ac-config-default)

(require 'lcomp)
(lcomp-mode 1)
(lcomp-keys-mode 1)
