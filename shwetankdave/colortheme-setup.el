(require-package 'cyberpunk-theme)
(add-hook 'after-init-hook
          (lambda () (load-theme 'cyberpunk t)))
(setq color-theme-is-global t)
