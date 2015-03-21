;; Remove the UI
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))
(setq inhibit-startup-message t)
(set-fringe-mode '(1 . 1))
(setq use-dialog-box nil)

;; Make sure path is correct when launched as application
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(push "/usr/local/bin" exec-path)

;; Add the top level emacs config directory to the load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Setup the package management
(require 'init-packages)

;; Install the essential packages
(require 'init-essential)

;; Load the configuration
(let ((custom-file (expand-file-name "emacs-custom.el" user-emacs-directory))
      (defuns-dir (expand-file-name "defuns" user-emacs-directory))
      (config-dir (expand-file-name "config" user-emacs-directory))
      (user-config-dir (expand-file-name user-login-name user-emacs-directory)))
  (progn
    (when (file-exists-p custom-file) (load custom-file))
    (when (file-exists-p defuns-dir)
      (add-to-list 'load-path defuns-dir)
      (mapc 'load (directory-files defuns-dir nil "^[^#].*el$")))
    (when (file-exists-p config-dir)
      (add-to-list 'load-path config-dir)
      (mapc 'load (directory-files config-dir nil "^[^#].*el$")))
    (when (file-exists-p user-config-dir)
      (add-to-list 'load-path user-config-dir)
      (mapc 'load (directory-files user-config-dir nil "^[^#].*el$")))))

;; Run the emacs server
(require 'server)
(unless (server-running-p) (server-start))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-diff-options (quote ("--ignore-all-space" "--ignore-space-change")))
 '(shell-pop-shell-type
   (quote
    ("eshell" "*eshell*"
     (lambda nil
       (eshell shell-pop-term-shell)))))
 '(shell-pop-universal-key "M-`")
 '(shell-pop-window-height 100)
 '(shell-pop-window-position "top"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#fcf4dc" :foreground "#52676f" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "apple" :family "Menlo"))))
;;  '(emacs-lisp-mode-default ((t (:inherit autoface-default :height 100 :family "Menlo"))) t))
