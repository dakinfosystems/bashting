;;==============================================================================
;; ycmd - You Complete Me Daemon
;; -----------------------------
;;
;; ycmd is code completion package. It has two parts. One us ycmd server which
;; expose api for code-completion and other code-comprehension use-cases like
;; semantic GoTo commands (and others). For certain filetypes, ycmd can also
;; provide diagnostic errors and warnings.
;;
;;==============================================================================

;; cloned ycmd directory
(defvar my:ycmd-server-command
  '("python" "/home/visteon/.emacs.d/external/servers/ymcd/ycmd"))
(defvar my:ycmd-extra-conf-whitelist
  '("~/.emacs.d/external/configs/ycm_extra_conf.py"))
(defvar my:ycmd-global-config "~/.emacs.d/external/configs/ycm_extra_conf.py")

;; Compilation command for C/C++
(defvar my:compile-command "clang++ -Wall -Wextra -std=c++14 ")

;; Add path load path of emcas-ycmd. If using git reop
(add-to-list 'load-path (expand-file-name "~/.emacs.d/external/emacs-ycmd"))

(require 'ycmd)

;; Add hook for c++
(add-hook 'c++-mode-hook 'ycmd-mode)

;; Set path of ycmd server
(set-variable 'ycmd-server-command  my:ycmd-server-command)
(set-variable 'ycmd-extra-conf-whitelist my:ycmd-extra-conf-whitelist)
(set-variable 'ycmd-global-config my:ycmd-global-config)
(setq ycmd-force-semantic-completion t)


;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package '(
		   f		;; require in company-ycmd
		   ))
  (unless (package-installed-p package)
    (package-install package)))

;; Using company-mode to manage completion
(require 'company-ycmd)
(company-ycmd-setup)

;; Using flycheck
(require 'flycheck-ycmd)
(flycheck-ycmd-setup)


;; To use company-mode need to setup comapny
(require 'setup-company)

;; TO use flycheck nned to setup flycheck
(require 'setup-flycheck)

;;------------------------*---------------------*------------------*------------
(provide 'setup-ycmd)
