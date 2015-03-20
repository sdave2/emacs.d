;; Get file-path of the current buffer
(defun copy-filename ()
  (interactive)
  (message "Copied filename %s" (kill-new (buffer-file-name))))

;; -- all keybindings --
(global-set-key (kbd "C-c c") 'copy-filename)
(global-set-key (kbd "M-t") 'toggle-window-split)
