(defun line-to-top-of-window () (interactive) (recenter 0))

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p) (split-window-horizontally))
  ;; (when (one-window-p) (split-window-vertically))
  (other-window 1))

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

;; http://www.bookshelf.jp/soft/meadow_30.html#SEC404
(defun window-toggle-division ()
  "ウィンドウ 2 分割時に、縦分割<->横分割"
  (interactive)
  (unless (= (count-windows 1) 2)
    (error "ウィンドウが 2 分割されていません。"))
  (let (before-height (other-buf (window-buffer (next-window))))
    (setq before-height (window-height))
    (delete-other-windows)

    (if (= (window-height) before-height)
        (split-window-vertically)
      (split-window-horizontally)
      )

    (switch-to-buffer-other-window other-buf)
    (other-window -1)))