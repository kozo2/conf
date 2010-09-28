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

;; http://dev.ariel-networks.com/articles/emacs/part1/
;(global-set-key (kbd "C-x C-b") 'anything)

(global-set-key "\C-cp" 'replace-string)

(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\C-cm" 'describe-mode)
(global-set-key "\C-cc" 'copy-file-path)

;; http://blog.clouder.jp/archives/000673.html
(global-set-key "\C-x\C-i" 'indent-region)

(global-set-key "\M- " 'set-mark-command)

;; http://d.hatena.ne.jp/Dubhead/20081203#p1
(global-set-key "\M-[" 'highlight-changes-previous-change)
(global-set-key "\M-]" 'highlight-changes-next-change)

(global-set-key "\C-w" ctl-x-map)
;(global-set-key "\C-wj" 'kill-region)
(global-set-key "\C-wj" 'tcode-mode)

(global-set-key "\M-n" '(lambda () (interactive) (find-tag last-tag 1)))