(global-set-key (kbd "C-h") 'delete-backward-char)

;(define-key ctl-x-map "\C-q" 'quoted-insert)
(global-set-key "\C-x" universal-argument-map)

(global-set-key "\C-o" 'toggle-input-method)
(global-set-key "\C-m" 'newline-and-indent)

;; ctl-x-map
(global-set-key "\C-u" ctl-x-map)
(define-key ctl-x-map "\C-g" 'magit-status)
(define-key ctl-x-map "\C-u" 'dired-jump-other-window)
(define-key ctl-x-map "\C-r" 'dired-jump)
(define-key ctl-x-map "\C-j" 'ffap-read-only)
(define-key ctl-x-map "\C-o" 'delete-other-windows)

;; anything
(global-set-key (kbd "C-n") 'anything)
(define-key anything-map "\C-j" 'anything-next-line)
(define-key anything-map "\C-k" 'anything-previous-line)
;; (global-set-key "\C-r" 'anything-execute-extended-command)
(define-key ctl-x-map "g" 'anything-imenu)

;; ;; swap *-w
;; (global-set-key "\C-w" 'kill-ring-save)
;; (global-set-key "\M-w" 'kill-region)

;(global-set-key "\C-s" 'save-buffer)
;(global-set-key "\M-s" 'isearch-forward)

;; http://dev.ariel-networks.com/Members/inoue/recommended-emacs-el
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-s" 'search-forward-regexp)
(global-set-key "\M-u" 'scroll-down)
(global-set-key "\M-/" 'tags-search)
(global-set-key "\M-m" 'blink-matching-open)
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


;; dired
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;(global-set-key "\C-i" 'dabbrev-expand)
;;(global-set-key "\C-i" 'hippie-expand)

;; auto-complete
(define-key ac-menu-map "\C-j" 'ac-next)
(define-key ac-menu-map "\C-k" 'ac-previous)

;; bf-mode
(define-key bf-mode-map "j" 'bf-mode-next)
(define-key bf-mode-map "k" 'bf-mode-previous)
;; (define-key bf-mode-map "n" 'bf-mode-toggle-browse-alternative)
;;   (define-key bf-mode-map "h" 'bf-mode-change-heading)

;; e2wm
;(global-set-key (kbd "M-+") 'e2wm:start-management)

;; smartchr
(global-set-key (kbd "=") (smartchr '(" = " "=" " == ")))
(global-set-key (kbd "+") (smartchr '(" + " "+")))
(global-set-key (kbd "<") (smartchr '(" < " "<")))
(global-set-key (kbd ">") (smartchr '(" > " ">")))
(global-set-key (kbd ",") (smartchr '(", " ",")))
(global-set-key (kbd "\"") (smartchr '("\"`!!'\"" "\"\"`!!'" "\"")))
(global-set-key (kbd "(") (smartchr '("(`!!')" "()`!!'" "(")))
(global-set-key (kbd "[") (smartchr '("[`!!']" "[]`!!'" "[")))
(global-set-key (kbd "{") (smartchr '("{`!!'}" "{}`!!'" "{")))

;; my functions
(global-set-key (kbd "C-z") 'line-to-top-of-window)
(global-set-key (kbd "C-t") 'other-window-or-split)
(define-key ctl-x-map "|" 'window-toggle-division)
