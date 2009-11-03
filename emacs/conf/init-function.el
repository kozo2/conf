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

;; http://d.hatena.ne.jp/IMAKADO/20080913
(eval-when-compile (require 'cl))
(defun my-chr (list-of-string)
  (lexical-let ((los list-of-string)
                (last-word "")
                (count 0))
    (lambda ()
      (interactive)
      (if (eq this-command real-last-command)
          (incf count)
        (setq count 0))
      (when (>= count (length los))
        (setq count 0))
      (let ((word (nth count los)))
        (when (eq this-command real-last-command)
          (delete-backward-char (length last-word)))
        (setq last-word word)
        (insert word)))))

;; (global-set-key (kbd "=") (my-chr '(" = " " == " " === ")))

