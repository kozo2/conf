;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; http://d.hatena.ne.jp/kazu-yamamoto/20080219/1203423707
(defun my-load-path (path)
  (let ((epath (expand-file-name path)))
    (unless (member epath load-path)
      (setq load-path (cons epath load-path)))))

(my-load-path "~/projects/dotfiles/emacs/conf")
(my-load-path "~/.emacs.d/elisp")

(load "init-load")
