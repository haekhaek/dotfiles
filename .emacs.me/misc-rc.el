;;; package --- Summary
;;; Commentary:

;;; no start message
(setq inhibit-startup-message t)

;;; no toolbar
(tool-bar-mode -1)

;;; change yes no questions to y n
(fset 'yes-or-no-p 'y-or-n-p)

;;; show battery level
(require 'battery)
(when (and battery-status-function
 	   (not (string-match-p "N/A" 
 				(battery-format "%B"
 						(funcall battery-status-function)))))
  (display-battery-mode 1))

;;; set font
(add-to-list 'default-frame-alist '(font . "Iosevka-23" ))
(set-face-attribute 'default t :font "Iosevka-23" )

;(require 'column-marker)
;(add-hook 'foo-mode-hook (lambda () (interactive) (column-marker-1 80)))

;;; set line numbers
(setq-default display-line-numbers 'visual
              display-line-numbers-current-absolute t
              display-line-numbers-width 4
              display-line-numbers-widen t)
(set-face-attribute 'line-number nil
                    :font "Iosevka Term")
(set-face-attribute 'line-number-current-line nil
                    :font "Iosevka Term"
                    :background "white" :foreground "black")

;;; move line
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

;;; install posframe package
(use-package posframe :ensure t)
;;; install try package
(use-package try
  :ensure t)
;;; Highlights the current cursor line
(global-hl-line-mode t)
;;; flashes the cursor's line when you scroll
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
;;; (setq beacon-color "#666600")
  )

;;; deletes all the whitespace when you hit backspace or delete
(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

;;; install multiple cursors
(use-package multiple-cursors
  :ensure t)

;;; expand the marked region in semantic increments (negative prefix to reduce region)
(use-package expand-region
  :ensure t
  :config 
  (global-set-key (kbd "C-=") 'er/expand-region))

(setq save-interprogram-paste-before-kill t)

;; you might not want this
(global-auto-revert-mode 1)
;; or this
(setq auto-revert-verbose nil)
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "<f6>") 'revert-buffer)
