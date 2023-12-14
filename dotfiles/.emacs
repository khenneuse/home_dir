;;;
;; Setup the path
;;;
(add-to-list 'exec-path "/opt/homebrew/bin")

;;;
;; Other commands that drive me nuts to not have
;;;
(define-key global-map "\M-g" 'goto-line)
(define-key global-map "\C-z" 'shell)

;; initial window
(setq initial-frame-alist
      '(
        (width . 80) ; character
        (height . 60) ; lines
        ))

;; default/sebsequent window
(setq default-frame-alist
      '(
        (width . 80) ; character
        (height . 60) ; lines
        ))

;;; ISpell
(setq ispell-program-name "/usr/local/bin/ispell")

;;;
;; Turn on specific colors
;; Font-Lock stuff
;;;
(global-font-lock-mode t)


(require 'package)
(add-to-list 'package-archives
    '("melpa" . "https://melpa.org/packages/")
    '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(setq visible-bell t
      inhibit-startup-message t         ; I know emacs by now
      column-number-mode t
      transient-mark-mode t
      grep-find-use-xargs t

      ; set up the modes so we can view appropriately
      auto-mode-alist (append auto-mode-alist
                              (list
			       '("\\.personal_alias" . shell-script-mode)
			       '("\\.personal_functions" . shell-script-mode)
                               '("\\.jsp$" . html-mode)
                               '("\\.js$" . java-mode)
                               '("\\.php$" . php-mode)
                               '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode)
                              '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode)
                               '("\\.properties$" . makefile-mode)
                               '("\\.tld$" . sgml-mode)
                               '("\\.tar$" . archive-mode)
                               '("\\.jar$" . archive-mode)
                               '("\\.war$" . archive-mode)
                               '("\\.ear$" . archive-mode)
                               '("\\.gz$"  . archive-mode)
                               '("\\.tgz$"  . archive-mode)
                               '("\\.zip$" . archive-mode)
                               ))

      ;; Confirm before quit (C-x C-c isn't always fat finger friendly...)
      kill-emacs-query-functions
      (cons (lambda () (y-or-n-p "Terminate Emacs? "))
            kill-emacs-query-functions))

;;; Setup Tramp for remote file work
(setq tramp-default-method "ssh")

;;; Get rid of those annoying tabs in files.
(setq indent-tabs-mode nil)

(add-hook 'before-save-hook      'delete-trailing-whitespace)

;; create a function for joining all of the lines in a buffer
(defun join-lines-in-buffer ()
  (interactive)
  (beginning-of-buffer)
  (end-of-line)
  (while (< (point) (point-max))
    (insert " ")
    (delete-char 1)
    (end-of-line)))

(defun insert-current-date ()
  (interactive)
  (insert (shell-command-to-string "echo -------------------$(date +%Y-%m-%d)-------------------")))

(defun uniquify-region-lines (beg end)
  "Remove duplicate adjacent lines in region."
  (interactive "*r")
  (save-excursion
    (goto-char beg)
    (while (re-search-forward "^\\(.*\n\\)\\1+" end t)
      (replace-match "\\1"))))

(defun uniquify-buffer-lines ()
  "Remove duplicate adjacent lines in the current buffer."
  (interactive)
  (uniquify-region-lines (point-min) (point-max)))

;;; Function for converting DOS files to Unix files
;;; C-x RET f undecided-unix

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(css-indent-offset 2)
 '(ediff-split-window-function 'split-window-horizontally)
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "dist" "node_modules"))
 '(grep-find-ignored-files
   '(".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "babel.json"))
 '(js-indent-level 2)
 '(package-selected-packages '(jq-format editorconfig sql-indent typescript-mode))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(put 'erase-buffer 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
