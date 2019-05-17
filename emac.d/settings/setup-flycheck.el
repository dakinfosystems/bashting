;;==============================================================================
;; Configure flycheck
;;
;; Note: For C++ we use flycheck-ycmd
;;==============================================================================
(require 'flycheck)
;; Turn flycheck on everywhere
(global-flycheck-mode t)

;; There are issues with company mode and flycheck in terminal mode.
;; This is outlined at:
;; https://github.com/abingham/emacs-ycmd
(when (not (display-graphic-p))
  (setq flycheck-indication-mode nil))

;;-------------------------*--------------------*------------------*------------
(provide 'setup-flycheck)
