;;; vue-custom.el --- Init for vue

;; Author: Kevin Du
;; Maintainer: Kevin Du
;; Version: 0.1
;; Package-Requires: ((vue-mode))
;; Homepage: https://github.com/xandeer/purcell-custom

;;; Commentary:

;; commentary

;;; Code:
(require-package 'vue-mode)
(require-package 'stylus-mode)
(require-package 'pug-mode)

(setq pug-tab-width 2)

(provide 'vue-custom)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; vue-custom.el ends here
