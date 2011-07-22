(global-set-key (kbd "C-h") 'delete-backward-char)

(global-set-key "\C-u" ctl-x-map)
;(define-key ctl-x-map "\C-q" 'quoted-insert)
(global-set-key "\C-x" universal-argument-map)

(global-set-key "\C-o" 'kill-line)

(global-set-key "\C-j" 'next-line)
(global-set-key "\C-k" 'previous-line)

(global-set-key "\C-p" 'toggle-input-method)
(global-set-key "\C-m" 'newline-and-indent)

;; anything
(global-set-key (kbd "C-n") 'anything)
(define-key anything-map "\C-j" 'anything-next-line)
(define-key anything-map "\C-k" 'anything-previous-line)
;; (global-set-key "\C-r" 'anything-execute-extended-command)

;; ;; swap *-w
;; (global-set-key "\C-w" 'kill-ring-save)
;; (global-set-key "\M-w" 'kill-region)

(define-key ctl-x-map "\C-u" 'dired-jump)
(define-key ctl-x-map "|" 'window-toggle-division)
;(define-key ctl-x-map "\C-o" 'delete-other-windows)

;(global-set-key "\C-s" 'save-buffer)
;(global-set-key "\M-s" 'isearch-forward)

;; http://dev.ariel-networks.com/Members/inoue/recommended-emacs-el
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-s" 'search-forward-regexp)
(global-set-key "\M-u" 'scroll-down)
(global-set-key "\M-/" 'tags-search)
(global-set-key "\M-m" 'blink-matching-open)
(global-set-key "\C-cg" 'imenu)
(setq imenu-always-use-completion-buffer-p 'never)
;; (global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))

(global-set-key "\C-cp" 'replace-string)
;;(global-set-key "\C-ca" 'align-regexp)
(global-set-key "\C-ca" (lambda () (interactive) (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil)))
(global-set-key (kbd "C-c r") 'query-replace)

;; (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil)

;; ;; http://blog.clouder.jp/archives/000673.html
;; ;;(global-set-key "\C-x\C-i" 'indent-region)

;; ;; http://d.hatena.ne.jp/Dubhead/20081203#p1
;; (global-set-key "\M-[" 'highlight-changes-previous-change)
;; (global-set-key "\M-]" 'highlight-changes-next-change)

;; (global-set-key "\M-n" '(lambda () (interactive) (find-tag last-tag 1)))
