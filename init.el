
;;;;
;; Packages.OB
;;;;
(require 'cl)
(require 'color)
(require 'package)

(defun update-load-path (&rest _)
  "Update `load-path'."
  (dolist (dir '("site-lisp" "lisp"))
    (push (expand-file-name dir user-emacs-directory) load-path)))

(update-load-path)


;;;;
;; Packages in lisp folder
;;;;
(require 'dirtree)

;;;;
;; Package management.
;;;;
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/") 
;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

(require 'org-bullets)
(require 'ido)

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(delete-selection-mode 1)
(add-to-list 'load-path "~/.emacs.d/customizations")

;;;;
;; Monokai theme.
;;;;
;(load-theme 'monokai t)
(load-theme 'nord t)

;;;;
;; Use org-bullets mode when in org-mode
;;;;
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-agenda-files (list "C:\\users\\stuarts\\org\\todo.org"))
(setq org-log-done t)

(ido-mode 1) ; ido autocomplete / suggestion mode.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face 'default)
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("a59ba6cba4e6050606e53f90142573902e0eb7b38f0c14ffbbc960fb90013f0e" "b30ab3b30e70f4350dad6bfe27366d573ace2190cc405c619bd5e602110c6e0c" "15e8afd8234959bee6d72e796d97aebc237a610fe359a540908cbd273071c53e" "a41b81af6336bd822137d4341f7e16495a49b06c180d6a6417bf9fd1001b6d2b" "79586dc4eb374231af28bbc36ba0880ed8e270249b07f814b0e6555bdcb71fab" "83ae405e25a0a81f2840bfe5daf481f74df0ddb687f317b5e005aa61261126e9" default))
 '(ensime-sem-high-faces
   '((var :foreground "#9876aa" :underline
	  (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
			 (:color "#808080"))
     (implicitParams :underline
		     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6")))
 '(fci-rule-color "#3C3D37")
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   '(nord-theme darcula-theme monokai-pro-theme solarized-theme ac-nrepl cider clojurescript-mode dirtree direx diredful diredfl doom-modeline smooth-scrolling scroll-restore clojure-env pretty-symbols babel tagedit sublime-themes smex rainbow-delimiters projectile paredit org-bullets monokai-theme magit immaterial-theme dracula-theme clojure-mode-extra-font-locking arc-dark-theme))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))


(menu-bar-mode 0)                                   ; hide the menu bar as we are always in a terminal.
(setq org-ellipsis "↷ ")                            ; change the ellipses (= ... =) to arrow.
(setq org-src-fontify-natively t)
(setq org-hide-leading-stars t)

;;;;
;; Replace lambda with greek lambda symbol
;;;;
(defun my-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(("lambda" . ?λ)
	  ("defn" . ?λ)
	  ("fn" . ?λ)
	  ("let" . ?⊢)
          ("some?" . ?∃)
          ("forall" . ?∀)
          ("set/union" . ?⋃)
          ("set/intersection" . ?⋂)
          ("<=" .?≤)
          (">=" . ?≥)
          ("not=" . ?≠)
          ("def" . ?≡)
          ("and" . ?∨)
          ("or" . ?∨)
          ("#{}" .?ø)
          ("reduce +" . ?∑)
          ("->" . ?➝)
	  ("->>" . ?↠)
          ("as->" . ?⥇)
          ("infinity" .?∞)
)))

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook 'my-pretty-lambda)      ; add pretty lambdas to scheme mode.
(add-hook 'lisp-mode-hook 'my-pretty-lambda)        ; add pretty lambdas to lisp mode.
(add-hook 'ClojureScript-mode-hook 'my-pretty-lambda)
(global-prettify-symbols-mode 1)                    ; pretty symbols.
(global-hl-line-mode t)                             ; highlight the line that has the cursor.
(recentf-mode 1)
(scroll-restore-mode 1)                             ;
(smooth-scrolling-mode 1)                           ; smooth scrolling, rather than jumping on page.

;;;;
;; org mode
;;;;
(setq org-agenda-files '("~/org")
      org-todo-keywords
      '((sequence "TODO(t)" "DOING(i)" "HANGUP(h)" "|" "DONE(d)" "CANCEL(c)")
        (sequence "⚑(T)" "🏴(I)" "❓(H)" "|" "✔(D)" "✘(C)"))
      org-todo-keyword-faces '(("HANGUP" . warning)
                               ("❓" . warning))
      org-priority-faces '((?A . error)
                           (?B . warning)
                           (?C . success))
      org-tags-column -80
      org-log-done 'time
      org-catch-invisible-edits 'smart
      org-startup-indented t
      org-ellipsis (if (char-displayable-p ?) "  " nil)
      org-pretty-entities nil
      org-hide-emphasis-markers t)

;;;;
;; Set better backup directory
;;;;
(unless backup-directory-alist
    (setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                   "backups")))))
;;;;
;; Clojure mode
;;;;
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojurescript-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'clojurescript-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode-hook #'my-pretty-lambda)
(add-hook 'clojurescript-mode-hook #'my-pretty-lambda)

