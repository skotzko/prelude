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

;; make command key act as control, but retain access to super key
;; for occasional use of nice prelude functionality (show recent files, etc)
(setq mac-command-modifier 'control)
(setq mac-control-modifier 'control)
(setq ns-right-control-modifier 'super)
(setq ns-right-command-modifier 'super) ;; for ze laptop keyboard


;; lorem ipsum setup
(require 'lorem-ipsum)
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
;; setup autopair and enable in all buffers
(require 'autopair)
(autopair-global-mode)

;; setup rspec mode and rspec snippets
(require 'rspec-mode)
(eval-after-load 'rspec-mode
 '(rspec-install-snippets))

;; setup multi term
(require 'multi-term)
(setq multi-term-program "/bin/bash")
(global-set-key (kbd "C-S-t") 'multi-term)
(global-set-key (kbd "C-S-n") 'multi-term-next)

;; make gui emacs load path from shell on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


; setup multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-M-e") 'mark-sexp)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
(global-set-key (kbd "S-C-d") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-g") 'mc/mark-all-like-this)

;; setup org2blog
(package-initialize) 
(require 'netrc) ;; or nothing if already in the load-path
(require 'org2blog)
(require 'xml-rpc-autoloads)
(require 'org2blog-autoloads)
(require 'metaweblog)
(add-hook 'org-mode-hook 'org2blog/wp-mode)

(setq arsblog 
      (netrc-machine (netrc-parse "~/.netrc") "andrewblog" t))
(setq org2blog/wp-blog-alist
      '(("andrewblog"
         :url "http://www.andrewskotzko.com/xmlrpc.php"
         :username (netrc-get arsblog "login")
         :password (netrc-get arsblog "password"))))


;; enable perspective minor mode for projectile
(persp-mode)
(require 'persp-projectile)
(define-key projectile-mode-map (kbd "s-s") 'projectile-persp-switch-project)
;; helm keybinding
(global-set-key (kbd "C-c h") 'helm-projectile)
