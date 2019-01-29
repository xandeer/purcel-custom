;;; org-custom.el --- org configuration

;; Author: Kevin Du
;; Maintainer: Kevin Du
;; Version: 0.1
;; Homepage: https://github.com/xandeer/purcell-custom

;;; Commentary:

;; commentary

;;; Code:

(require-package 'general)
(general-def org-mode-map
  "C-c p" 'org-previous-visible-heading
  "C-c n" 'org-next-visible-heading
  "C-c b" 'org-switchb
  "M-h" 'org-insert-subheading)

(after-load 'org
  (add-to-list 'org-babel-load-languages '(js . t))
  (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
  (add-to-list 'org-babel-tangle-lang-exts '("js" . "js")))


(setq org-M-RET-may-split-line '((headline) (default . t)))

(setq org-directory "~/Dropbox/notes")
(setq org-agenda-files '("~/Dropbox/notes/gtd.org"))
(setq org-default-notes-file (concat org-directory "/journal.org"))
(setq org-refile-targets '((nil :maxlevel . 5)
                           ("someday.org" :maxlevel . 5)
                           (org-agenda-files :maxlevel . 5)))

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DELEGATE(e)" "DONE(d)")
        (sequence "|" "CANCELED(c@/!)")))

(setq org-tag-alist '(("office" . ?o)
                      ("home" . ?h)
                      ("call" . ?c)
                      ("family" . ?f)))

(defun org-custom-archive-done-tasks ()
  "Archive finished tasks."
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'tree))

(provide 'org-custom)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; org-custom.el ends here
