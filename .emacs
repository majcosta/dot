(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
(setq use-package-always-defer t)

(use-package magit
  :ensure t)

(use-package lsp-mode
  :config
  (setq lsp-enable-snippet nil)
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :commands lsp lsp-deferred)
(add-hook 'c-mode-hook 'lsp-deferred)
(add-hook 'c++-mode-hook 'lsp-deferred)
(add-hook 'rust-mode-hook 'lsp-deferred)

(use-package cmake-ts-mode
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'")
  :hook (cmake-ts-mode . lsp-deferred))
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration '(cmake-ts-mode . "cmake"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("neocmakelsp" "stdio"))
                     :major-modes '(cmake-ts-mode)
                     :server-id 'neocmakelsp)))
(setq gc-cons-threshold (* 100 1024 1024 ))
(setq lsp-enable-on-type-formatting t)
(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))
(use-package lsp-ui
  :ensure t)
(use-package rustic
  :ensure t)
(use-package company
  :ensure t)
(with-eval-after-load 'company
     (setq company-backends
	   (seq-difference company-backends '(company-ispell company-dabbrev))))
(setq lsp-enable-on-type-formatting nil)

(setq fill-column 85)
(column-number-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(load-theme 'tango-dark t)
(setq compilation-scroll-output t)
(add-hook 'compilation-mode-hook 'next-error-follow-minor-mode)

(setq magit-log-section-commit-count 20)

;; Save all backup files (~ files) in a central folder
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups/"))))
;; Save all auto-save files (# files) in a central folder
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-saves/") t)))
;; Prevent the creation of lock files (.# files) entirely
(setq create-lockfiles nil)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
