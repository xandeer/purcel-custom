;;; kotlin-custom.el --- kotlin configuration

;; Author: Kevin Du
;; Maintainer: Kevin Du
;; Version: 0.1
;; Package-Requires: ((kotlin-mode "1"))
;; Homepage: https://github.com/xandeer/purcell-custom

;;; Commentary:

;; commentary

;;; Code:

(require-package 'kotlin-mode)

(after-load 'kotlin-mode
  (setq kotlin-tab-width 2))

(provide 'kotlin-custom)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; kotlin-custom.el ends here
