(defun line-to-top-of-window () (interactive) (recenter 0))
(global-set-key (kbd "C-z") 'line-to-top-of-window)

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p) (split-window-horizontally))
  ;; (when (one-window-p) (split-window-vertically))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

;; http://www.emacswiki.org/cgi-bin/wiki/PythonMode#toc7
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;; http://d.hatena.ne.jp/stakizawa/20060829/t1
(defun copy-file-path()
  (interactive)
  (let ((filename (buffer-file-name)))
    (kill-new filename)
    (message "%s" filename)))
