(require-package 'color-theme)
(require-package 'color-theme-solarized)
(setq current-theme '(color-theme-solarized-dark))
(defun set-theme ()
  (progn
    (setq hour
          (string-to-number
           (substring (current-time-string) 11 13)))
    (if (member hour (number-sequence 6 18))
        (setq now '(color-theme-solarized-dark))
      (setq now '(color-theme-solarized-light))))
  (if (eq now current-theme)
      nil
    (setq current-theme now))
  (eval current-theme))

(after 'color-theme-solarized-autoloads
  (color-theme-initialize)
  (set-theme)
  (setq color-theme-is-global t))

;; Set a timer to change theme after 6:00 pm.
(run-at-time 0 3600 'set-theme)
