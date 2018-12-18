;; Some defaults from http://ensime.github.io/editors/emacs/learning/
;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 column-number-mode t
 scroll-error-top-bottom t
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; Unset "suspend Emacs"
(global-unset-key (kbd "C-z"))

;; Enables s-arrows to move point to corresponding pane
(windmove-default-keybindings)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 90 :width normal)))))

(electric-pair-mode 1)
(setq electric-pair-pairs
  '(
    (?\" . ?\")
    (?\' . ?\')
    (?\« . ?\»)
    ))

;; turn on highlight matching brackets when cursor is on one
(setq show-paren-delay 0)
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
 '(package-selected-packages (quote (highlight-symbol ensime use-package projectile))))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package ensime
  :ensure t
  :pin melpa-stable)

(setq ensime-startup-notification nil)

;; Projectile configuration
(use-package projectile)
(projectile-mode +1)
;(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-project-search-path '("~/Riaktr/sources/snd-batches"))

(use-package highlight-symbol
             :init
             (bind-key "C-<f3>" 'highlight-symbol)
             (bind-key "<f3>" 'highlight-symbol-next)
             (bind-key "S-<f3>" 'highlight-symbol-prev)
             (bind-key "M-<f3>" 'highlight-symbol-query-replace))

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
