;; http://dev.ariel-networks.com/Members/inoue/recommended-emacs-el
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-s" 'search-forward-regexp)
(global-set-key "\M-u" 'scroll-down)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-/" 'tags-search)
(global-set-key "\M-m" 'blink-matching-open)
(global-set-key "\C-cg" 'imenu)
(setq imenu-always-use-completion-buffer-p 'never)
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))

;; http://d.hatena.ne.jp/rubikitch/20080117
(global-set-key "\C-j" 'anything)
;(global-set-key (kbd "C-x b") 'anything)

(global-set-key "\C-cp" 'replace-string)
(global-set-key "\C-cr" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\C-cm" 'describe-mode)
(global-set-key "\C-cc" 'copy-file-path)

(global-set-key "\C-c\C-b" 'pop-tag-mark)
(global-set-key "\C-c\C-f" 'find-tag)
(global-set-key "\C-c\C-u" 'expand-abbrev)

;; http://blog.clouder.jp/archives/000673.html
(global-set-key "\C-x\C-i" 'indent-region)

(global-set-key "\C-o" 'dabbrev-expand)
;(global-set-key "\M-/" 'redo)
(global-set-key "\M- " 'set-mark-command)

;; http://d.hatena.ne.jp/Dubhead/20081203#p1
(global-set-key "\M-[" 'highlight-changes-previous-change)
(global-set-key "\M-]" 'highlight-changes-next-change)

(global-set-key "\C-w" ctl-x-map)