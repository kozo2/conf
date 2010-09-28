(global-set-key (kbd "C-c r") 'query-replace)
(defalias 'qrr 'query-replace-regexp)

(require 'color-moccur)
(setq moccur-split-word t)

(require 'moccur-edit)
(setq moccur-split-word t)

;; (require 'igrep)
;; (igrep-define lgrep (igrep-use-zgrep nil)(igrep-regex-option "-n -0u8"))
;; (igrep-find-define lgrep (igrep-use-zgrep nil)(igrep-regex-option "-n -0u8"))

;; (require 'grep-a-lot)
;; (grep-a-lot-setup-keys)
;; (grep-a-lot-advise igrep)

(require 'grep-edit)
