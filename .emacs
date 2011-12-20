;; Frame size
(add-to-list 'default-frame-alist '(height . 54))
(add-to-list 'default-frame-alist '(width . 99))

;;Set paths
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/themes/")

;; Reload .emacs file by typing: M-x reload
(defun reload () "Reloads .emacs interactively."
(interactive)
(load "~/.emacs"))

(set-scroll-bar-mode 'right)

;; Disable toolbar
(tool-bar-mode -1)

;;
(add-to-list 'load-path "~/.emacs.d/elim/elisp")
(autoload 'garak "garak" nil t)

;; Turn off startup message
(setq inhibit-startup-message t)

;; Cosmetics   
(global-hl-line-mode 1)
(line-number-mode 1)
(display-time)

;; I'm a fish. I need consistency i.e.copy cut paste
(cua-mode t)  

;; file percentage in modeline
(if (require 'sml-modeline nil 'noerror)      ;; use sml-modeline if available
  (progn 
      (sml-modeline-mode 1)                   ;; show buffer pos in the mode line
      (scroll-bar-mode -1))                   ;; turn off the scrollbar
      (scroll-bar-mode 1)                     ;; otherwise, show a scrollbar...
      (set-scroll-bar-mode 'right))           ;; ... on the right

;; kill empty buffers M-x clean-buffer-list
(require 'midnight)

;; Syntax hilighting!!
(global-font-lock-mode t)

;; Line numbering
(require 'linum)
(global-linum-mode 1) 

;; Kill welcome screen
(setq inhibit-startup-message t)


;; Monday is the first day
(setq calendar-week-start-day 1) 

;; Printing in A4
(setq ps-paper-type 'a4)

;; theme
(require 'color-theme)
(color-theme-initialize)
;(load-file "~/.emacs.d/themes/color-theme-railscasts.el")

;tangotango
(load-file "~/.emacs.d/themes/color-theme-tangotango.el")
(color-theme-tangotango)

;solarized
(add-to-list 'load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(require 'color-theme-solarized)
;(color-theme-solarized-light)
;(color-theme-solarized-dark)

;(color-theme-zenburn)
;(light)


;; Hilight matching parenthesis
;; To customize the background color
;(set-face-foreground 'hl-line "orange") 
;(set-face-background 'hl-line "#323232")

;; don't blink the cursor
(blink-cursor-mode -1)


;oceandeep
;(set-background-color "#10303f")
;(set-foreground-color "#9eafbf")
(set-cursor-color "green")

;; Format the title-bar to always include the buffer name
(setq frame-title-format "emacs - %b")

;; Make the mouse wheel scroll Emacs
(mouse-wheel-mode t)

;; SLIME!
(add-to-list 'load-path "~/.emacs.d/slime-2010-06-20/")  ; your SLIME directory
(setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
(require 'slime)
(slime-setup)

;;  Lispy stuff

(global-font-lock-mode t)   ;syntax highlighting
(show-paren-mode 1)            ;highlights parentheses
(add-hook 'lisp-mode-hook '(lambda ()      ; enter ensures identation
      (local-set-key (kbd "RET") 'newline-and-indent))) 

;;font

(set-default-font "Inconsolata 10")
;(set-default-font "Monaco 8")
;(set-default-font "montecarlo")

;;Vim emulation .. i really miss vim
;(require 'vimpulse)

;; dvorak emacs keys								  
;(keyboard-translate ?\C-e ?\C-x)
;(keyboard-translate ?\C-j ?\C-t)
;(keyboard-translate ?\C-r ?\C-x)

; my keys
(global-set-key (kbd "C-x r") 'recompile)  ;; recompile goodness
(global-set-key (kbd "C-x C-b") 'buffer-menu)  ;; buffer list
(global-set-key (kbd "C-c e") 'djcb-erc-start-or-switch) ;; ERC

;; auctex
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;; Weather
;(require 'google-weather)

;; IRC stuff
;(require 'erc)


;; w3m 

;(require 'w3m-load)

;; Nethack
;(autoload 'nethack "nethack" "Play Nethack." t)
;(setq nethack-program "/usr/games/nethack")


;; auto-complete-mode
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

(auto-complete-mode)

;; Python related
;;; Electric Pairs
(add-hook 'python-mode-hook
     (lambda ()
      (define-key python-mode-map "\"" 'electric-pair)
      (define-key python-mode-map "\'" 'electric-pair)
      (define-key python-mode-map "(" 'electric-pair)
      (define-key python-mode-map "[" 'electric-pair)
      (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;; Wanderlust conf

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; IMAP
(setq elmo-imap4-default-server "imap.gmail.com")
(setq elmo-imap4-default-user "glyras@gmail.com") 
(setq elmo-imap4-default-authenticate-type 'clear) 
(setq elmo-imap4-default-port '993)
(setq elmo-imap4-default-stream-type 'ssl)

(setq elmo-imap4-use-modified-utf7 t) 

;; SMTP
(setq wl-smtp-connection-type 'starttls)
(setq wl-smtp-posting-port 587)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user "mattofransen")
(setq wl-smtp-posting-server "smtp.gmail.com")
(setq wl-local-domain "gmail.com")

(setq wl-default-folder "%inbox")
(setq wl-default-spec "%")
(setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAP
(setq wl-trash-folder "%[Gmail]/Trash")

(setq wl-folder-check-async t) 

(setq elmo-imap4-use-modified-utf7 t)

(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

;; Twittering mode

;(add-to-list 'load-path "/home/shevek/.emacs.d/twittering-mode")
;(require 'twittering-mode)
;(setq twittering-use-master-password t)
;(setq twittering-icon-mode t)

;; Emacs-w3m

;(require 'w3m-load)
;(setq w3m-default-display-inline-images t)

;; Swank

(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
