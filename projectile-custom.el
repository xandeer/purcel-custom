;;; projectile-custom.el --- projectile configuration

;; Author: Kevin Du
;; Maintainer: Kevin Du
;; Version: 0.1
;; Homepage: https://github.com/xandeer/purcell-custom

;;; Commentary:

;; commentary

;;; Code:
(require-package 'projectile)

;; (setq projectile-indexing-method 'hybrid)
;; When running `projectile-switch-project`(C-c C-p p), `neotree` Will change root automatically.
(after-load 'neotree
  (setq projectile-switch-project-action 'neotree-projectile-action))

(provide 'projectile-custom)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; projectile-custom.el ends here
