(require 'anything)
(require 'anything-config)
(require 'anything-match-plugin)

(setq anything-sources
      '(anything-c-source-buffers+
	anything-c-source-file-name-history
	anything-c-source-buffer-not-found
	anything-c-source-imenu
	))

(setq imenu-auto-rescan t)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)