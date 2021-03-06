(defun prettier-eslint-stdio--filter (proces output)
  (message "OUTPUT: %s" output))

(let ((process (start-process "prettier-stdio"
                              nil
                              "node"
                              "/Users/aaronjensen/Source/prettier-eslint-stdio/index.js")))
  (set-process-filter process 'prettier-eslint-stdio--filter)
  (setq prettier-eslint-stdio-process process))

(progn
  (process-send-string prettier-eslint-stdio-process "/Users/aaronjensen/Source/prettier-eslint-stdio/example.js\nconst i = 3;\n")
  (process-send-string prettier-eslint-stdio-process "\n# END ")
  (accept-process-output prettier-eslint-stdio-process))

(defun foo ()
  (interactive))

(global-set-key (kbd "C-c d") 'foo)

(provide 'prettier-eslint-stdio)
