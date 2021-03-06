;;;; set
;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;(set-language-environment "Japanese")
;(set-language-environment "UTF-8")

;; https://gist.github.com/yoshinari-nomura/3465571
(when (and (>= emacs-major-version 24)
           (eq window-system 'ns))
  ;; フォントセットを作る
  (let* ((fontset-name "myfonts") ; フォントセットの名前
         (size 14) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
         (asciifont "Menlo") ; ASCIIフォント
         (jpfont "Hiragino Maru Gothic ProN") ; 日本語フォント
         (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
         (fontspec (font-spec :family asciifont))
         (jp-fontspec (font-spec :family jpfont))
         (fsn (create-fontset-from-ascii-font font nil fontset-name)))
    (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
    (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
    (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec) ; 半角カナ
    (set-fontset-font fsn '(#x0080 . #x024F) fontspec)    ; 分音符付きラテン
    (set-fontset-font fsn '(#x0370 . #x03FF) fontspec)    ; ギリシャ文字
    )
  
  ;; デフォルトのフレームパラメータでフォントセットを指定
  (add-to-list 'default-frame-alist '(font . "fontset-myfonts"))

  ;; フォントサイズの比を設定
  (dolist (elt '(("^-apple-hiragino.*"               . 1.2)
		 (".*osaka-bold.*"                   . 1.2)
		 (".*osaka-medium.*"                 . 1.2)
		 (".*courier-bold-.*-mac-roman"      . 1.0)
		 (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
		 (".*monaco-bold-.*-mac-roman"       . 0.9)))
    (add-to-list 'face-font-rescale-alist elt))
  
  ;; デフォルトフェイスにフォントセットを設定
  ;; # これは起動時に default-frame-alist に従ったフレームが
  ;; # 作成されない現象への対処
  (set-face-font 'default "fontset-myfonts"))

(add-hook 'markdown-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-j") 'markdown-insert-list-item)
	    (local-set-key (kbd "M-p") 'markdown-move-list-item-up)
	    (local-set-key (kbd "M-n") 'markdown-move-list-item-down)
	    ))

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (linum-mode 1)
	    (auto-complete-mode 1)
	    (local-set-key (kbd "C-o") 'helm-lisp-completion-at-point)
	    (paredit-mode +1)
	    ))

(add-hook 'lisp-interaction-mode-hook
          (lambda ()
            (paredit-mode +1)
            ))

(add-hook 'python-mode-hook
          (lambda ()
            (linum-mode 1)
            (auto-complete-mode 1)
            (paredit-mode +1)
            ))

(setq dired-dwim-target t)
(setq debug-on-error t)
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq enable-recursive-minibuffers t)
(setq visible-bell t)

(setq debug-on-error 1)

(setq dabbrev-case-fold-search nil)
(setq dabbrev-case-replace nil)
(setq use-dialog-box nil)
(setq make-backup-files nil)
(setq line-move-visual nil)

(setq gc-cons-threshold (* 10 gc-cons-threshold))
(setq message-log-max 10000)
(setq history-length 1000)
(setq echo-keystrokes 0.1)
(setq large-file-warning-threshold (* 25 1024 1024))
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(delete (assoc 'which-func-mode mode-line-format) mode-line-format)
(setq-default header-line-format '(which-func-mode ("" which-func-format)))

(set-frame-parameter nil 'alpha '90)

;;;; def
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))
(defalias 'message-box 'message)
(defalias 'yes-or-no-p 'y-or-n-p)
;(fset 'yes-or-no-p 'y-or-n-p)
(defalias 'qrr 'query-replace-regexp)

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p) (split-window-horizontally))
  ;; (when (one-window-p) (split-window-vertically))
  (other-window 1))

;; http://d.hatena.ne.jp/khiker/20100119/window_resize
(defun my-window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))



;;;; mode
(scroll-bar-mode 0)
(global-auto-revert-mode 1)
(winner-mode 1)
(recentf-mode 1)

(windmove-default-keybindings)

(global-hl-line-mode 1)
;(set-face-background 'hl-line "darkolivegreen")
(savehist-mode 1)
(show-paren-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(transient-mark-mode 1)
(which-func-mode 1)
(display-time-mode 1)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(display-time)

;;;; global remap
(global-set-key (kbd "C-u") 'execute-extended-command)
(global-set-key (kbd "C-h") 'delete-backward-char)

;;;; addon
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(helm-mode 1)

(require 'e2wm)
(setq e2wm:c-code-recipe
      '(| (:left-max-size 30)
        imenu main))
(setq e2wm:c-code-winfo
      '((:name main)
	(:name imenu :plugin imenu :default-hide nil))
      )
(global-set-key (kbd "C-r") 'e2wm:dp-code)

(require 'direx)
(require 'popwin)
(popwin-mode 1)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

;(elscreen-start)

(require 'auto-complete-config)
(ac-config-default)

(powerline-default-theme)

(require 'auto-save-buffers-enhanced)
;(setq auto-save-buffers-enhanced-interval 1)
(auto-save-buffers-enhanced t)

(require 'tc-setup)
