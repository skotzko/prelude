;; mad props to prelude: https://github.com/bbatsov/prelude

;; set color theme
(load-theme 'sanityinc-tomorrow-night)

;; make emacs auto-indent globally by default
(define-key global-map(kbd"RET")'newline-and-indent)

;; windmove keybindings to move around with shift + arrow key
(windmove-default-keybindings)
;; fix windmove conflict w/ org-mode
(setq org-replace-disputed-keys t)

;; show line numbers globallyo
(global-linum-mode 1)

;; NOTES: will this work on normal keyboard setup? did this setup using external keyboard;
;; not sure how this will translate to non-mac systems

;; swap left control and super keys to get nice positioning but
;; availability of prelude super functionality
(setq mac-command-modifier 'control)
(setq mac-control-modifier 'super)
;;(setq mac-option-modifier 'meta)


;; lorem ipsum setup
(autoload 'Lorem-ipsum-insert-paragraphs "lorem-ipsum" "" t)
(autoload 'Lorem-ipsum-insert-sentences "lorem-ipsum" "" t)
(autoload 'Lorem-ipsum-insert-list "lorem-ipsum" "" t)

;; disable the minimize and quit keybindings since running in GUI mode
(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-x C-z"))

;; unset the built in minimize keys
(global-unset-key (kbd "C-z"))


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

;; require ido & setup flex matching
(require 'ido)
(require 'flx-ido)
(ido-mode t)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; setup smex for M-x minibuffer
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; enable desktop save mode to easily resume work where left off
(desktop-save-mode 1)

;; bind Control-return to add newline after current one and switch to it
(global-set-key (kbd "<C-return>") (kbd "C-e C-j")
)
