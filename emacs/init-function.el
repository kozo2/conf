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
