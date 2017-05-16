(defun clear-eshell ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))


(use-package shell-pop :ensure t
  :config
  (setq eshell-buffer-maximum-lines 1024)
  :bind
  (("C-c C-q" . clear-eshell)))
