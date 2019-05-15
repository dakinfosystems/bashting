;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Init file is first file that is executed when emacs is starts up
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;)

;;-------------------------------------------------------------------------------
;; setting functionality
;; Note: use t to true and nil to false
;;-------------------------------------------------------------------------------
(setq *macbook-pro-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))
(setq *win32* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *linux-x* (and window-system *linux*) )
(setq *xemacs* (featurep 'xemacs) )
(setq *emacs23* (and (not *xemacs*) (or (>= emacs-major-version 23))) )
(setq *emacs24* (and (not *xemacs*) (or (>= emacs-major-version 24))) )


;;-------------------------------------------------------------------------------
;; Functions (load all files in defuns-dir)
;; Copied from https://github.com/magnars/.emacs.d/blob/master/init.el
;;-------------------------------------------------------------------------------
(setq defuns-dir (expand-file-name "~/.emacs.d/defuns"))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))


;;------------------------------------------------------------------------------
;; Load third party packages
;;------------------------------------------------------------------------------
;; Check if package is installed if not then install

(package-initialize)

(setq package-archives '(("melpa-stable" . "htpps://stable.melpa.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))

(defun packages-require (&rest packs)
    "Install and load a package. If the package is not available
   installs it automaticaly."
    (mapc  (lambda (package)
	     (unless (package-installed-p package)
	       (package-install package)
	       ;;#'package-require
	       ))

	   packs

	   ))

;;
(packages-require
 'zeno-theme	;; for theme zeno
 'moe-theme	;; for meo theme
 )


;;-------------------------------------------------------------------------------
;; Load own settings
;;-------------------------------------------------------------------------------
;; Set dir path in variable
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)


;;------------------------------------------------------------------------------
;; Set up you setting. If you don't want any setting then comment out the same
;;------------------------------------------------------------------------------

;; Appearance or Theme settings. File: ./setting/appearance.el
(require 'appearance)

;; General setting file: ./setting/general.el
(require 'general)

;; Ivy-swiper setting. file: ./setting/setup-ivy.el
(require 'setup-ivy)

;----------------------*------------------*------------------*-------------------
(message "Init done!!")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((bug-reference-bug-regexp . "#\\(?2:[[:digit:]]+\\)")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
