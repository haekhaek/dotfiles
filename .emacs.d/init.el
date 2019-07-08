(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(org-confirm-babel-evaluate nil)
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Sync/orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-src-fontify-natively t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (google-c-style haskell-mode column-enforce-mode markdown-preview-mode markdown-mode org-pdfview atomic-chrome wgrep-ag wgrep treemacs-projectile treemacs origami dumb-jump ace-window org-bullets which-key use-package try)))
 '(scroll-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(my-long-line-face ((((class color)) (:background "gray10"))) t)
 '(my-tab-face ((((class color)) (:background "grey10"))) t)
 '(my-trailing-space-face ((((class color)) (:background "gray10"))) t))

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;; load scripts from others
(add-to-list 'load-path "~/.emacs.others/")

;; this higlights the column of the cursor is
(load "~/.emacs.others/column-marker.el")
(load "~/.emacs.others/highlight-beyond-fill-column.el")
(load "~/.emacs.others/multiple-cursors-rc.el")
;(load "~/.emacs.others/google-c-style.el")


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(load "~/.emacs.me/atomic-chrom.el")
(load "~/.emacs.me/autocomplete.el")
(load "~/.emacs.me/avy.el")
(load "~/.emacs.me/better-shell.el")
(load "~/.emacs.me/code.el")
(load "~/.emacs.me/cpp.el")
(load "~/.emacs.me/company.el")
(load "~/.emacs.me/dired.el")
(load "~/.emacs.me/dump-jump.el")
(load "~/.emacs.me/flycheck.el")
(load "~/.emacs.me/git.el")
(load "~/.emacs.me/haskell.el")
(load "~/.emacs.me/hydra.el")
(load "~/.emacs.me/ibuffer.el")
(load "~/.emacs.me/iedit.el")
(load "~/.emacs.me/javascript.el")
(load "~/.emacs.me/markdown.el")
(load "~/.emacs.me/misc-rc.el")
(load "~/.emacs.me/origami.el")
(load "~/.emacs.me/org-mode.el")
(load "~/.emacs.me/pdf-tools.el")
(load "~/.emacs.me/reveal-js.el")
(load "~/.emacs.me/switch-windows.el")
(load "~/.emacs.me/swiper-ivy-counsel.el")
(load "~/.emacs.me/themes.el")
(load "~/.emacs.me/treemacs.el")
(load "~/.emacs.me/undo.el")
(load "~/.emacs.me/web-mode.el")
(load "~/.emacs.me/wgrep.el")
(load "~/.emacs.me/which.el")
(load "~/.emacs.me/yasnippets.el")
