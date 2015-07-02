;; Get file-path of the current buffer
(defun copy-filename ()
  (interactive)
  (message "Copied filename %s" (kill-new (buffer-file-name))))

(defun copy-buffer-name ()
  (interactive)
  (message "Copied buffer name %s" (kill-new (buffer-name))))

;; -- all keybindings --
(bind-key "C-c c" 'copy-filename)
(bind-key "C-c b" 'copy-buffer-name)
(bind-key "M-t" 'toggle-window-split)
(bind-key "M-~" 'other-frame)
