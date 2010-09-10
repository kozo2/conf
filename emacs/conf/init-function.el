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
