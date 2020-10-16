;; ;; Assuming usage with dart-mode
;; (use-package dart-mode
;;   :ensure-system-package (dart_language_server . "pub global activate dart_language_server")
;;   :custom
;;   (dart-format-on-save t)
;;   (dart-sdk-path "/Applications/flutter/bin/cache/dart-sdk/"))

;; (use-package flutter
;;   :after dart-mode
;;   :bind (:map dart-mode-map
;;               ("C-M-x" . #'flutter-run-or-hot-reload))
;;   :custom
;;   (flutter-sdk-path "/Applications/flutter/"))

;; ;; Optional
;; (use-package flutter-l10n-flycheck
;;   :after flutter
;;   :config
;;   (flutter-l10n-flycheck-setup))
