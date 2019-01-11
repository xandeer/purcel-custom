;;; neotree-custom.el --- neotree configuration

;; Author: Kevin Du
;; Maintainer: Kevin Du
;; Version: 0.1
;; Package-Requires: ((neotree "0.5.2"))
;; Homepage: https://github.com/xandeer/purcell-custom

;;; Commentary:

;; commentary

;;; Code:

(require-package 'neotree)

(setq neo-vc-integration '(char face))
;; Every time when the neotree window is opened, let it find current file and jump to node.
(setq neo-smart-open t)

(provide 'neotree-custom)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; neotree-custom.el ends here
