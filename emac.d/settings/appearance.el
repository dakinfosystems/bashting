;;=========================================================================
;; General Settings
;;=========================================================================
;; setting line number
(setq line-number-mode t)

;; Set column number mode
(setq column-number-mode t)

;; set line highlight. 1 for true and -1 for false
(global-hl-line-mode -1)
(set-face-background hl-line-face "white")	;; Set color of highlight

;; Set modeline(statusbar) custom color
(set-face-foreground 'mode-line-inactive "#606060")     ;; lightgreen color
(set-face-background 'mode-line-inactive "#586E75")	;; lightcyan color

;; If you want to change color of active modeline then uncomment below
;; line and change color
;; (set-face-foreground 'mode-line "#839496")		;; unknown
;; (set-face-background 'mode-line "#002B36")		;; unknown

;; Disable the toolbar at the top since it's useless
(if (functionp 'tool-bar-mode) (tool-bar-mode -1))

;; Disable the menu bar since we don't use it, especially not in the
;; terminal
(when (and (not (eq system-type 'darwin)) (fboundp 'menu-bar-mode))
    (menu-bar-mode -1))

;; Auto-wrap at 80 characters
;; (setq-default auto-fill-function 'do-auto-fill)
;; (setq-default fill-column 80)
;; (turn-on-auto-fill)

;; Disable auto-fill-mode in programming mode
;; (add-hook 'prog-mode-hook (lambda () (auto-fill-mode -1)))

;; Highlight some keywords in prog-mode
(add-hook 'prog-mode-hook
	  (lambda ()
	    ;; Highlighting in cmake-mode this way interferes with
	    ;; cmake-font-lock, which is something I don't yet understand.
	    (when (not (derived-mode-p 'cmake-mode))
	      (font-lock-add-keywords
	       nil
	       '(("\\<\\(FIXME\\|TODO\\|BUG\\|DONE\\)"
		  1 font-lock-warning-face t))))
	    )
	            )

;; It is to to provide feature is require is used
(provide 'appearance)
