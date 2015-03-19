(setq backup-directory-alist '(("." . "~/.saves")))
(put 'upcase-region 'disabled nil)

(global-linum-mode 1)
(setq-default python-basic-offset 4)
(setq c-default-style "linux" c-basic-offset 4)

;;multiple cursors
;(require 'multiple-cursors)
(global-set-key (kbd "C-c C-;") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Let's use CYGWIN bash...
;;
(setq binary-process-input t) 
(setq w32-quote-process-args ?\") 
(setq shell-file-name "C:/cygwin/bin/bash") ;; or sh if you rename your bash executable to sh. 
(setenv "SHELL" shell-file-name) 
(setq explicit-shell-file-name shell-file-name) 
(setq explicit-sh-args '("-login" "-i"))

(defun cygwin-shell ()
  "Run cygwin bash in shell mode."
  (interactive)
  (let ((explicit-shell-file-name "C:/cygwin/bin/bash"))
    (call-interactively 'shell)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(ibuffer-saved-filter-groups (quote (("c-groups" ("c-files" (used-mode . c-mode))))))
 '(ibuffer-saved-filters
   (quote
    (("Dired_Filter"
      ((used-mode . dired-mode)))
     ("gnus"
      ((or
	(mode . message-mode)
	(mode . mail-mode)
	(mode . gnus-group-mode)
	(mode . gnus-summary-mode)
	(mode . gnus-article-mode))))
     ("programming"
      ((or
	(mode . emacs-lisp-mode)
	(mode . cperl-mode)
	(mode . c-mode)
	(mode . java-mode)
	(mode . idl-mode)
	(mode . lisp-mode)))))))
 '(magit-git-executable "c:/Program Files (x86)/git/cmd/git.exe")
 '(package-selected-packages (quote (ggtags magit multiple-cursors))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(load-file "~/.emacs.d/macros")

(add-hook 'dired-mode-hook 'ggtags-mode)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
