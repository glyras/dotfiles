;;
;; Init.el/.emacs written by Giorgos Lyras
;;

;; Melpa repository setting
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


;; Remove startup messages
(setq inhibit-startup-screen t)

;; Start maximized
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Appearance
(load-theme 'gruvbox t)

(tool-bar-mode -1)
(menu-bar-mode -1)

;(set-face-attribute 'default nil :font "Inconsolata-12" )
(set-frame-font "Terminus-12" nil t)

;; Lines
(global-linum-mode t)

;; neotree
 (add-to-list 'load-path "/some/path/neotree")
  (require 'neotree)
  (global-set-key [f8] 'neotree-toggle)
