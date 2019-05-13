;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                                                                                                                                                                      
;; Setup packages install                                                                                                                                                                                                                                                      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                                                                                                                                                                       
(setq package-archives '(("melpa-stable" . "htpps://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))


(setq *spell-check-support-enabled* t)
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


;;-------------------------------------------------------------------------------
;; Load settings
;;-------------------------------------------------------------------------------
;; Set dir path in variable
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)


;; Appearance oo Theme settings
;;-------------------------------------------------------------------------------
(require 'appearance)

;; General setting
;;-------------------------------------------------------------------------------
(require 'general)


;----------------------*------------------*------------------*-------------------
(message "Init done!!")
