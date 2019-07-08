(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)


(use-package google-c-style
  :ensure t)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(use-package column-enforce-mode
  :ensure t)

(add-hook 'prog-mode-hook 'column-enforce-mode)
(setq column-enforce-comments nil)

(custom-set-faces
 '(my-tab-face            ((((class color)) (:background "grey10"))) t)
 '(my-trailing-space-face ((((class color)) (:background "gray10"))) t)
 '(my-long-line-face ((((class color)) (:background "gray10"))) t))

(add-hook 'font-lock-mode-hook
	  (function
	   (lambda ()
	     (setq font-lock-keywords
		   (append font-lock-keywords
			   '(("\t+" (0 'my-tab-face t))
;			     ("^.\\{81,\\}$" (0 'my-long-line-face t))
			     ("[ \t]+$"      (0 'my-trailing-space-face t))))))))
