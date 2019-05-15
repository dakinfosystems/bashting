;;==============================================================================
;; Ivy Swipper
;; -----------
;;
;; Ivy is a generic completion mechanism for Emacs. While it operates similarly
;; to other completion schemes such as icomplete-mode, Ivy aims to be more
;; efficient, smaller, simpler, and smoother to use yet highly customizable.
;;
;;==============================================================================

;; Add path load path of swiper
(add-to-list 'load-path (expand-file-name "~/.emacs.d/git/swiper"))

;;(message "load-path: %s" load-path)
(require 'ivy)
(require 'swiper)
(require 'counsel)

;; Set ivy mode on
(ivy-mode 1)

;; Ivy personallize setting
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")


;; Ivy-based interface to standard commands
(global-set-key (kbd "C-c i s") 'swiper)
;(global-set-key (kbd "C-x x") 'counsel-M-x)     ;; As it is already mapped
(global-set-key (kbd "C-c i f") 'counsel-find-file)
(global-set-key (kbd "<f2> f") 'counsel-describe-function)
(global-set-key (kbd "<f2> v") 'counsel-describe-variable)
(global-set-key (kbd "<f2> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)


;;----------------------------------------------------------
(provide 'setup-ivy)
