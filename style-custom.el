;;; style-custom.el --- style configuration

;; Author: Kevin Du
;; Maintainer: Kevin Du
;; Version: 0.1
;; Package-Requires: ((atom-one-dark-theme "0.4.0") (linum-relative "0.6") (telephone-line "0.4") (git-gutter "0.90"))
;; Homepage: https://github.com/xandeer/purcell-custom

;;; Commentary:

;; commentary

;;; Code:

(require-package 'atom-one-dark-theme)
(require-package 'linum-relative)
(require-package 'telephone-line)
(require-package 'git-gutter)

(set-face-attribute 'default nil :height 165)
(load-theme 'atom-one-dark)

(global-git-gutter-mode +1)

;;; linum-relative
(setq linum-relative-backend 'display-line-numbers-mode)
(linum-relative-global-mode)

;;; telephone
(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
      telephone-line-primary-right-separator 'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
(setq telephone-line-evil-use-short-tag nil)
(telephone-line-mode 1)


(provide 'style-custom)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; style-custom.el ends here
