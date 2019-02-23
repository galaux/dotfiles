;; https://github.com/gjstein/emacs.d/blob/master/init.el


;; Install use-package if necessary
(require 'package)
(setq package-enable-at-startup nil)

(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package diminish
  :ensure t)

;; Enable use-package
(eval-when-compile
  (require 'use-package))
;; use-package always ensures packages are installed
(setq use-package-always-ensure t)
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

;; Splash Screen to Org-mode
(setq inhibit-splash-screen t
      initial-scratch-message nil
      mouse-yank-at-point t
      x-select-enable-clipboard nil)

;; Turn off the menu bar at the top of frames
(menu-bar-mode -1)

;; Remove the graphical toolbar at the top
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(custom-set-faces
 '(default ((t (:family "DejaVu Sans Mono"
                :foundry "PfEd"
                :slant normal
                :weight normal
                :height 90
                :width normal)))))

(use-package base16-theme
  :config
  (load-theme 'base16-railscasts t))

;; Tell Emacs to write `custom-set-variables` and `custom-set-faces`
;; to this file that we will not load (prevents Emacs cluttering init.el.
(setq custom-file (concat user-emacs-directory "/custom.el"))

(setq create-lockfiles nil
      scroll-error-top-bottom t
      mouse-yank-at-point t)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Unset "suspend Emacs"
(global-unset-key (kbd "C-z"))

;; Enables s-arrows to move point to corresponding pane
(windmove-default-keybindings)

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist
          `(("." . ,(concat user-emacs-directory "backups"))))

(setq auto-save-file-name-transforms
  `((".*" "~/.emacs.d/auto-saves/" t)))

(electric-pair-mode 1)
(setq electric-pair-pairs
  '(
    (?\" . ?\")
    (?\' . ?\')
    (?\« . ?\»)
    ))

(setq electric-indent-mode nil)

;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)

(use-package which-key
  :config
  (which-key-mode 1))

(use-package avy
  :bind ("C-M-;" . 'avy-goto-char-2))

(use-package markdown-mode)

(use-package projectile
  :demand
  :init   (setq projectile-use-git-grep t)
  :config (projectile-global-mode t)
  :bind-keymap   ("C-c p" . projectile-command-map))

(use-package clojure-mode)
(use-package clojure-mode-extra-font-locking)

(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
             pretty-parens  ; different paren styles for different modes.
             paredit        ; Introduce some paredit commands.
             smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
             smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)))

(use-package company
  :diminish company-mode
  :commands company-mode
  :init
  (setq
   company-dabbrev-ignore-case nil
   company-dabbrev-code-ignore-case nil
   company-dabbrev-downcase nil
   company-idle-delay 0
   company-minimum-prefix-length 4)
  :config
  ;; disables TAB in company-mode, freeing it for yasnippet
  (define-key company-active-map [tab] nil)
  (define-key company-active-map (kbd "TAB") nil))

;; TODO set it inside the use-package above
(add-hook 'after-init-hook 'global-company-mode)

(use-package expand-region
  :commands 'er/expand-region
  :bind ("C-=" . er/expand-region))


(use-package smex
  :bind ("M-x" . 'smex))

;; A collection of paredit-like functions for editing in html-mode.
;(use-package tagedit)

;(use-package ido-completing-read+)

(use-package cider
  ;; Because of bug in cider: https://github.com/clojure-emacs/cider/issues/2581
  :pin melpa
  :init
  (setq
   cider-repl-display-help-banner nil
   ;cider-default-cljs-repl 'figwheel-main
   ))

(use-package clj-refactor
  :init
  (progn
    (add-hook 'clojure-mode-hook #'clj-refactor-mode)
    ;; for adding require/use/import statements
    (add-hook 'clojure-mode-hook #'yas-minor-mode))
  (setq
   cljr-warn-on-eval nil)
  :config
  (cljr-add-keybindings-with-prefix "C-c C-m"))
