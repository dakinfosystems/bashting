;;; init.el --- Init file of emacs

;;==============================================================================
;;; Commentary:
;; Init file is first file that is executed when Emacs is starts up
;;==============================================================================

;;------------------------------------------------------------------------------
;; setting functionality
;; Note: use t to true and nil to false
;;------------------------------------------------------------------------------

;;; Code:
(setq *macbook-pro-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))
(setq *win32* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type
							  'berkeley-unix)) )
(setq *linux-x* (and window-system *linux*) )
(setq *xemacs* (featurep 'xemacs) )
(setq *emacs23* (and (not *xemacs*) (or (>= emacs-major-version 23))) )
(setq *emacs24* (and (not *xemacs*) (or (>= emacs-major-version 24))) )


;;------------------------------------------------------------------------------
;; Functions (load all files in defuns-dir)
;; Copied from https://github.com/magnars/.emacs.d/blob/master/init.el
;;------------------------------------------------------------------------------
(setq defuns-dir (expand-file-name "~/.emacs.d/defuns"))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))


;;------------------------------------------------------------------------------
;; Load third party packages
;;------------------------------------------------------------------------------
;; Check if package is installed if not then install

;; list the packages you want
(setq package-list '(
		     company
		     flycheck
		     ))

(setq package-archives '(("melpa-stable" . "htpps://stable.melpa.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))


(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
        (package-install package)))

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

;; Seting cc mode
(require 'setup-cc-mode)

;; Ivy-swiper setting. file: ./setting/setup-ivy.el
(require 'setup-ivy)

;; ycmd settings. file: ./setting/setup-ycmd.el
(require 'setup-ycmd)

;----------------------*------------------*------------------*-------------------
(message "Init done!!")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("0eccc893d77f889322d6299bec0f2263bffb6d3ecc79ccef76f1a2988859419e"
     "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3"
     "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" default)))
 '(safe-local-variable-values
   (quote
    ((bug-reference-bug-regexp . "#\\(?2:[[:digit:]]+\\)")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)

;; End
;;; init.el ends here
