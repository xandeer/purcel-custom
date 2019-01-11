;;; evil-custom.el --- configuration of evil

;; Author: Kevin Du
;; Maintainer: Kevin Du
;; Version: 0.1
;; Package-Requires: ((general "0.1") (evil "1.2.14"))
;; Homepage: https://github.com/xandeer/purcell-custom
;; Keywords: convenience

;;; Commentary:

;; commentary

;;; Code:

(require-package 'evil)
(require-package 'general)
(require-package 'evil-surround)
(require-package 'evil-easymotion)

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

;; Neotree in evil-mode
(after-load 'neotree
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle))

(provide 'evil-custom)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; evil-custom.el ends here
