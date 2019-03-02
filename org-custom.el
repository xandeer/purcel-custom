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
                           ("journal.org" :maxlevel . 5)
                           ("notes.org" :maxlevel . 5)
                           (org-agenda-files :maxlevel . 5)))

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DELEGATE(e)" "DONE(d)")
        (sequence "|" "CANCELED(c@/!)")))

(setq org-tag-alist '(("office" . ?o)
                      ("home" . ?h)
                      ("call" . ?c)
                      ("family" . ?f)))

(setq org-capture-templates
      `(("t" "todo" entry (file+headline "gtd.org" "Tasks")
         "* TODO %?\n%U\n" :clock-resume t :prepend t)
        ("c" "cache" entry (file+headline "" "Cache")
         "* %? %U" :prepend t)
        ("d" "Do It Tomorrow" entry (file+headline "gtd.org" "Tasks")
         "* TODO %?\n%(org-custom-scheduled-tomorrow)\n%U\n"
         :clock-resume t :prepend t)
        ("w" "word" item (file+olp+datetree "" "Words") ; "" => `org-default-notes-file'
         "%?" :prepend t)
        ("S" "sentences" item (file+headline "" "Sentences")
         "%? %U" :prepend t)
        ("x" "xmind" entry (file+olp+datetree "" "XMind")
         "* %^u-%^u\n进展：\n1. %?\n计划：\n1. \n" :prepend t)
        ("D" "daily review" entry (file+olp+datetree "" "Daily Review")
         (file ".daily-review.txt") :prepend t)
        ("W" "weekly review" entry (file+olp+datetree "" "Weekly Review")
         (file ".weekly-review.txt") :prepend t :tree-type week)
        ("b" "books want to read" item (file+olp "someday.org" "Books" "Want to Read")
         "1. %? %U" :prepend t)
        ("B" "books had read" item (file+olp "someday.org" "Books" "Read" "2019")
         "1. %? %^u" :prepend t)
        ("f" "films want to watch" item (file+olp "someday.org" "Films" "Want to Watch")
         "1. %? %U" :prepend t)
        ("F" "films had watched" item (file+olp "someday.org" "Films" "Watched" "2019")
         "1. %? %^u" :prepend t)
        ("i" "Ideas" entry (file+headline "someday.org" "Ideas")
         "* %? %U" :prepend t)
        ))

(setq org-reverse-note-order t)
(setq org-archive-reversed-order t)

(defun org-custom-scheduled-tomorrow ()
  "Return scheduled string on tomorrow."
  (format-time-string "SCHEDULED: <%F %a>"
                      (time-add (current-time) (* 24 3600))))

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
