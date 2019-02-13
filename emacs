;; Some defaults from http://ensime.github.io/editors/emacs/learning/

;; global variables (might be overridden by package `better-defaults`)
(setq inhibit-startup-screen t
      create-lockfiles nil
      column-number-mode t
      scroll-error-top-bottom t
      use-package-always-ensure t
      sentence-end-double-space nil
      mouse-yank-at-point t)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Unset "suspend Emacs"
(global-unset-key (kbd "C-z"))

;; Enables s-arrows to move point to corresponding pane
(windmove-default-keybindings)

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

;(electric-pair-mode 1)
;(setq electric-pair-pairs
;  '(
;    (?\" . ?\")
;    (?\' . ?\')
;    (?\« . ?\»)
;    ))

(setq electric-indent-mode nil)

;; comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; turn on highlight matching brackets when cursor is on one
;(setq show-paren-delay 0)
(show-paren-mode 1)

(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (avy
      ;; DONE
      which-key
      clojure-mode-extra-font-locking
      clojure-mode
      markdown-mode
      tagedit
      smex
      cider
      company
      ;; SHOULD I?
      ido-completing-read+
      ;; NOPE
      solarized-theme
      zenburn-theme
      snazzy-theme
      parinfer
      better-defaults
      ;; TODO
      smartparens
      expand-region
      highlight-symbol
      use-package
      projectile
      )))
 '(which-key-mode t))
;clj-refactor 

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(which-key-mode)

;(use-package ensime
;  :ensure t
;  :pin melpa-stable)

;(setq ensime-startup-notification nil)

;; Remember that this is just the Projectile suffix.
;; To use Projectile for the first time, add a known project then use
;; "C-c p p" to open a known project
(use-package projectile
  :demand
  :init   (setq projectile-use-git-grep t)
  :config (projectile-global-mode t)
  :bind-keymap   ("C-c p" . projectile-command-map))

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

(use-package highlight-symbol
             :diminish highlight-symbol-mode
             :commands highlight-symbol
             :bind ("C-<f3>" . 'highlight-symbol)
                   ("<f3>" . 'highlight-symbol-next)
                   ("S-<f3>" . 'highlight-symbol-prev)
                   ("M-<f3>" . 'highlight-symbol-query-replace))

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

(add-hook 'after-init-hook 'global-company-mode)

(use-package expand-region
  :commands 'er/expand-region
  :bind ("C-=" . er/expand-region))

(use-package smex
  :bind ("M-x" . 'smex))

(add-to-list 'load-path "~/.emacs.d/customizations")
(load "ui.el")

(use-package avy
  :bind ("C-M-;" . 'avy-goto-char-2))


(require 'clj-refactor)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(setq cljr-warn-on-eval nil)

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
