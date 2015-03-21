(after 'ruby-mode
  (add-hook 'ruby-mode-hook '(lambda ()
                               (local-set-key (kbd "RET")
                                              'reindent-then-newline-and-indent))))
