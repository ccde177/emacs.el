;; Startup
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

;; GUI
(when window-system
  (toggle-frame-maximized)
  (when (member "Source Code Pro" (font-family-list))
    (set-frame-font "Source Code Pro 13" nil t)))

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Packages
(use-package ef-themes
  :ensure t
  :config
  (load-theme 'ef-duo-dark t))
(use-package magit
  :ensure t
  :defer t)
(use-package rust-mode
  :ensure t
  :defer t)
(use-package rainbow-delimiters
  :ensure t
  :defer t)

;; Custom file
(setq custom-file "~/.emacs-custom.el")
(unless (file-exists-p custom-file)
  (make-empty-file custom-file))
(load custom-file)

;; Editing
(setq make-backup-files nil)
(setq c-basic-offset 4)
(setq kill-whole-line t)
(setq-default indent-tabs-mode nil)

;; Hooks and global modes
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(global-auto-revert-mode)
(global-display-line-numbers-mode)

;; Keymaps
(keymap-global-set "M-DEL" 'kill-whole-line)
(keymap-global-set "C-o"
		   (lambda ()
		     (interactive)
		     (end-of-line)
		     (newline-and-indent)))
(keymap-global-set "M-o"
		   (lambda ()
		     (interactive)
		     (beginning-of-line)
		     (newline)
		     (previous-line)
                     (indent-according-to-mode)))
