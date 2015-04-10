;; Get file-path of the current buffer
(defun copy-filename ()
  (interactive)
  (message "Copied filename %s" (kill-new (buffer-file-name))))

;; -- all keybindings --
(bind-key "C-c c" 'copy-filename)
(bind-key "M-t" 'toggle-window-split)
