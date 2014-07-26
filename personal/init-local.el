 ;;; package -- summary

;; set color theme
(load-theme 'sanityinc-tomorrow-night)





;; make emacs auto-indent globally by default
(define-key global-map(kbd"RET")'newline-and-indent)

;; windmove keybindings to move around with shift + arrow key
(windmove-default-keybindings)
;; fix windmove conflict w/ org-mode
(setq org-replace-disputed-keys t)

;; show line numbers
(global-linum-mode 1)

;; NOTES: will this work on normal keyboard setup? did this setup using external keyboard;
;; not sure how this will translate to non-mac systems
;; mac command key act like control key also
(setq mac-command-modifier 'control)
;; mac option key act like control key also
(setq mac-option-modifier 'meta)

;; lorem ipsum setup
(autoload 'Lorem-ipsum-insert-paragraphs "lorem-ipsum" "" t)
(autoload 'Lorem-ipsum-insert-sentences "lorem-ipsum" "" t)
(autoload 'Lorem-ipsum-insert-list "lorem-ipsum" "" t)

;; disable the minimize and quit keybindings since running in GUI mode
(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-x C-z"))

;; use inconsolata as default font
(add-to-list 'default-frame-alist '(font .  "Inconsolata-14"))

;; enable winner mode to save frames setup and undo/redo frames config
(winner-mode 1)

;; turn off mac internationalization to fix option key
(set-keyboard-coding-system nil)

;; make rvm.el load right ruby version when loading any ruby file
(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))

;; setup yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; turn on projectile globally for fast file switching / project nav
;; *** also make sure that the flx-ido mode is installed, better ido flex matching
(projectile-global-mode)


;;; Commentary:

;;; Code:

(provide 'init-local)
