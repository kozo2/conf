(defun line-to-top-of-window () (interactive) (recenter 0))
(global-set-key (kbd "C-z") 'line-to-top-of-window)

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p) (split-window-horizontally))
  ;; (when (one-window-p) (split-window-vertically))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

(require 'smartchr)
(global-set-key (kbd "=") (smartchr '(" = " "=" " == ")))

(global-set-key (kbd "+") (smartchr '(" + " "+")))
(global-set-key (kbd "<") (smartchr '(" < " "<")))
(global-set-key (kbd ">") (smartchr '(" > " ">")))

(global-set-key (kbd ",") (smartchr '(", " ",")))

(global-set-key (kbd "\"") (smartchr '("\"`!!'\"" "\"\"`!!'" "\"")))
(global-set-key (kbd "(") (smartchr '("(`!!')" "()`!!'" "(")))
(global-set-key (kbd "[") (smartchr '("[`!!']" "[]`!!'" "[")))
(global-set-key (kbd "{") (smartchr '("{`!!'}" "{}`!!'" "{")))

;; (require 'key-chord)
;; (setq key-chord-two-keys-delay 0.04)
;; (key-chord-mode 1)
;; (key-chord-define emacs-lisp-mode-map "jf" 'describe-function)

;;;; my keybind
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-m" 'newline-and-indent)

(define-key anything-map "\C-j" 'anything-next-line)
(define-key anything-map "\C-k" 'anything-previous-line)

;; change ctl-x-map
(global-set-key "\C-u" ctl-x-map)

(global-set-key "\C-j" 'next-line)
(global-set-key "\C-k" 'previous-line)

(global-set-key "\C-n" 'kill-line)
(global-set-key (kbd "C-;") 'anything)
;(global-set-key "\C-l" 'kill-line)

;; ;; anything for console emacs
;; ;;(global-set-key "\C-u" 'anything)

;; (global-set-key "\C-r" 'anything-execute-extended-command)
(global-set-key "\C-x" universal-argument-map)

;; ;; swap *-w
;; (global-set-key "\C-w" 'kill-ring-save)
;; (global-set-key "\M-w" 'kill-region)

;; for my IME toggle shortcut
(global-set-key "\C-p" 'set-mark-command)
;(define-key ctl-x-map "\C-q" 'quoted-insert)
(define-key ctl-x-map "\C-u" 'dired-jump)
(define-key ctl-x-map "\C-o" 'delete-other-windows)

(global-set-key "\C-s" 'save-buffer)
(global-set-key "\M-s" 'isearch-forward)

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
;; (global-set-key "\C-cc" 'comment-region)
;; (global-set-key "\C-cu" 'uncomment-region)
;;(global-set-key "\C-ca" 'align-regexp)
(global-set-key "\C-ca" (lambda () (interactive) (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil)))

;; (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil)
;; (global-set-key "\C-cm" 'describe-mode)

;; ;; http://blog.clouder.jp/archives/000673.html
;; ;;(global-set-key "\C-x\C-i" 'indent-region)

;; ;; http://d.hatena.ne.jp/Dubhead/20081203#p1
;; (global-set-key "\M-[" 'highlight-changes-previous-change)
;; (global-set-key "\M-]" 'highlight-changes-next-change)

;; ;;(global-set-key "\C-wj" 'tcode-mode)

;; (global-set-key "\M-n" '(lambda () (interactive) (find-tag last-tag 1)))
