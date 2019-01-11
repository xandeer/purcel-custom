;;; js-custom.el --- js configuration

;; Author: Kevin Du
;; Maintainer: Kevin Du
;; Version: 0.1
;; Homepage: https://github.com/xandeer/purcell-custom

;;; Commentary:

;; commentary

;;; Code:

(after-load 'js2-mode
  (require-package 'js2-refactor)
  (require-package 'xref-js2)

  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-r")
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
  (setq js2-strict-missing-semi-warning nil)

  (define-key js-mode-map (kbd "M-.") nil)

  (add-hook 'js2-mode-hook (lambda () (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))


(provide 'js-custom)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; js-custom.el ends here
