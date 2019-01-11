;;; purcell-custom.el --- purcell-custom

;; Author: Kevin Du
;; Maintainer: Kevin Du
;; Version: 0.1
;; Homepage: https://github.com/xandeer/purcell-custom

;;; Commentary:

;; commentary

;;; Code:


(setq ns-option-modifier 'meta)
(setq ns-command-modifier 'super)

;; stop creating backup~ files
(setq make-backup-files nil)
;; stop creating #autosave# files
(setq auto-save-default nil)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
;; which overrides the default "-c" (execute the following command). The addition of "-i" forces the shell into interactive mode, which leads to the sourcing of ~/.bashrc, ~/.zshrc, etc.
(setq shell-command-switch "-ic")


(require-package 'general)


(sanityinc/enable-ivy-flx-matching)


(general-define-key
 :keymaps 'override
 "M-;" 'shell-command
 "s-;" 'comment-line)


(require 'style-custom)
(require 'evil-custom)
(require 'yasnippet-custom)
(require 'neotree-custom)
(require 'projectile-custom)

(require 'js-custom)
(require 'kotlin-custom)


(provide 'purcell-custom)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; purcell-custom.el ends here
