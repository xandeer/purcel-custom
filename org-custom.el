;;; org-custom.el --- org configuration

;; Author: Kevin Du
;; Maintainer: Kevin Du
;; Version: 0.1
;; Homepage: https://github.com/xandeer/purcell-custom

;;; Commentary:

;; commentary

;;; Code:

(setq org-agenda-files '("/Users/kevin/Library/Mobile Documents/9CR7T2DMDG~com~ngocluu~onewriter/Documents/todo.org"))

(require-package 'general)
(general-def org-mode-map
  "C-c b" 'org-switchb
  "M-h" 'org-insert-subheading)

(after-load 'org
  (add-to-list 'org-babel-load-languages '(js . t))
  (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
  (add-to-list 'org-babel-tangle-lang-exts '("js" . "js")))


(setq org-M-RET-may-split-line '((headline) (default . t)))

(provide 'org-custom)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; org-custom.el ends here
