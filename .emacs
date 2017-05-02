

;;melpa  M-x list-packages
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;;tabbar ruller
;;(setq tabbar-ruler-global-tabbar t) ; If you want tabbar
 ;; (setq tabbar-ruler-global-ruler t) ; if you want a global ruler
 ;; (setq tabbar-ruler-popup-menu t) ; If you want a popup menu.
 ;; (setq tabbar-ruler-popup-toolbar t) ; If you want a popup toolbar
 ;; (setq tabbar-ruler-popup-scrollbar t) ; If you want to only show the
                                        ; scroll bar when your mouse is moving.
 ;; (require 'tabbar-ruler)

;;(global-set-key [C-tab] 'tabbar-ruler-move)

;;tabbar
(global-set-key [C-tab] 'tabbar-forward)
(global-set-key (kbd "C-`") 'tabbar-backward)

;;themes
;;afternoon is modified
(load-theme 'afternoon t)
;;(load-theme 'dark-krystal t)
;;(load-theme 'soft-morning t)
;;(load-theme 'labburn t)
;;mark text between brackets
(show-paren-mode t)
(setq show-paren-style 'expression)

;;font size
(set-face-attribute 'default nil :height 150)

;;erlang
(setq load-path (cons  "/usr/local/otp/lib/tools-<ToolsVer>/emacs"
load-path))
(setq erlang-root-dir "/usr/local/otp")
(setq exec-path (cons "/usr/local/otp/bin" exec-path))
(require 'erlang-start)
(add-to-list 'load-path "/home/panagiotis/distel/elisp")
(require 'distel)
(distel-setup)

;;terminal
(require 'multi-term)
(setq multi-term-program "/bin/bash")

(require 'auto-complete)
(global-set-key (kbd "C-c a") 'auto-complete-mode)


;;ssh from emacs
(setq tramp-default-method "ssh")


(global-set-key (kbd "C-c o") 'compile)
(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c m") 'multi-term)

;;ocaml

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    ;; Register Merlin
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    ;; Automatically start it in OCaml buffers
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)))


(load "/home/panagiotis/.opam/system/share/emacs/site-lisp/tuareg-site-file")

;;connect to parallel lab ntua
(defun orion()
  (interactive)
  (find-file "/ssh:parlab13@orion.cslab.ntua.gr:~")
  )

(defun scirouter()
  (interactive)
  (find-file "/ssh:parlab13@orion.cslab.ntua.gr|ssh:parlab13@scirouter.cslab.ntua.gr:~")
  )


(defun okeanos()
  (interactive)
  (find-file "/ssh:root@snf-729462.vm.okeanos.grnet.gr:~")
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "DarkOliveGreen3" "#e7c547" "DeepSkyBlue1" "#c397d8" "#70c0b1" "#2f4f4f"))
 '(custom-safe-themes
   (quote
    ("94d5e4fb72c42401d69d767685a822d8c0735a7b22ec7c48cb9ded3baece6d0c" default)))
 '(fci-rule-color "#14151E")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "goldenrod")
     (60 . "#e7c547")
     (80 . "DarkOliveGreen3")
     (100 . "#70c0b1")
     (120 . "DeepSkyBlue1")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "goldenrod")
     (200 . "#e7c547")
     (220 . "DarkOliveGreen3")
     (240 . "#70c0b1")
     (260 . "DeepSkyBlue1")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "goldenrod")
     (340 . "#e7c547")
     (360 . "DarkOliveGreen3"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
