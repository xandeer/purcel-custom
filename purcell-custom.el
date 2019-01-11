;;; purcell-custom --- purcell-custom
;;; Commentary:
;;; Code:

(set-face-attribute 'default nil :height 165)
(load-theme 'atom-one-dark)


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


;; before require neotree
(setq neo-vc-integration '(char face))

(require-package 'evil)
(require-package 'linum-relative)
(require-package 'neotree)
(require-package 'js2-mode)
(require-package 'projectile)
(require-package 'general)
(require-package 'telephone-line)
(require-package 'evil-surround)


(sanityinc/enable-ivy-flx-matching)


(general-define-key
 :keymaps 'override
 "M-;" 'shell-command
 "s-;" 'comment-line)

;;; git-gutter
(global-git-gutter-mode +1)


;;; telephone
(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
      telephone-line-primary-right-separator 'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
(setq telephone-line-evil-use-short-tag t)
(telephone-line-mode 1)


;;; Evil
(setq evil-cross-lines t)
(evil-mode 1)
(general-evil-setup)

(general-imap
  "C-a" 'beginning-of-line-text
  "C-e" 'end-of-line)

(general-create-definer general-nmmap :states '(normal motion))

(general-mmap
  "M-e" 'evil-scroll-line-up)

(general-mmap ";"
  (general-key-dispatch nil
    :timeout 0.5
    "t" 'neotree-toggle
    "v" 'git-gutter:popup-hunk
    "f" 'projectile-find-file
    "b" 'ivy-switch-buffer))

(general-mmap "w"
  (general-key-dispatch nil
    :timeout 0.5
    "o" 'switch-window
    "1" 'sanityinc/toggle-delete-other-windows
    "h" 'evil-window-left
    "l" 'evil-window-right
    "j" 'evil-window-down
    "k" 'evil-window-up
    "n" 'evil-window-vnew
    "v" (lambda () (interactive) (evil-window-vsplit) (evil-window-right 1))
    "b" (lambda () (interactive) (evil-window-vsplit) (evil-window-right 1) (ivy-switch-buffer))
    "f" (lambda () (interactive) (evil-window-vsplit) (evil-window-right 1) (projectile-find-file))
    "s" (lambda () (interactive) (evil-window-split) (evil-window-down 1))
    "c" 'evil-window-delete))

(general-imap "j"
  (general-key-dispatch 'self-insert-command
    :timeout 0.25
    "w" (lambda () (interactive) (evil-normal-state) (save-buffer))
    "j" 'evil-normal-state))

;; easymotion
(evilem-default-keybindings "SPC")
(evilem-define (kbd "SPC w") 'evil-forward-word-begin)


;;; linum-relative
(setq linum-relative-backend 'display-line-numbers-mode)
(linum-relative-global-mode)


;;; projectile
(setq projectile-indexing-method 'hybrid)


;;; neotree
;; Every time when the neotree window is opened, let it find current file and jump to node.
(setq neo-smart-open t)
;; When running `projectile-switch-project`(C-c C-p p), `neotree` Will change root automatically.
(setq projectile-switch-project-action 'neotree-projectile-action)'

;; Neotree in evil-mode
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)


(after-load 'js2-mode
  (require-package 'js2-refactor)
  (require-package 'xref-js2)

  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-r")
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
  (setq js2-strict-missing-semi-warning nil)

  (define-key js-mode-map (kbd "M-.") nil)

  (add-hook 'js2-mode-hook (lambda () (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))

(after-load 'kotlin-mode
  (setq kotlin-tab-width 2))


(provide 'purcell-custom)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; purcell-custom ends here
