;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!

;; Load personal modules
(load! "+javascript")

;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Gustav Holmsten"
      user-mail-address "gustav.holmsten@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; test
(setq doom-font (font-spec :family "Hack" :size 16)
      doom-variable-pitch-font (font-spec :family "Hack"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/Documents")
(require 'org)
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)

;; To get typescript syntax higilightin
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'load-path (expand-file-name "~/.doom.d/lisp"))
(add-to-list 'custom-theme-load-path "~/.doom.d/themes")

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'tide-mode-hook 'prettier-js-mode)
(add-hook 'markdown-mode-hook 'grip-mode)
(add-hook 'org-mode-hook 'grip-mode)

(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
(defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "c" 'ediff-copy-both-to-C))
(add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)


;; Keymaps
(map! :leader
      (:prefix "t"
        :nv "f" #'tide-fix
        :nv "r" #'tide-references
        :nv "d" #'tide-jump-to-definition
        :nv "e" #'tide-goto-error
        :nv "b" #'evil-jump-backward
        :nv "s r" #'tide-rename-symbol
        :nv "c f" #'tide-code-fix)
      (:prefix "ö"
        :nv "f w" #'deadgrep
        :nv "f f" #'counsel-fzf
        :nv "p s" #'+ivy/project-search
        :nv "w s" #'evil-window-decrease-height
        :nv "w e" #'evil-window-increase-height)

      (:prefix "v"
        :nv "f" #'vimish-fold-toggle
        :nv "c f" #'vimish-fold-avy
        :nv "n f" #'vimish-fold-next-fold
        :nv "t a" #'vimish-fold-toggle-all
        :nv "u a" #'vimish-fold-unfold-all
        :nv "r a" #'vimish-fold-refold-all)
      (:prefix "j"
       :nv "l" #'+ivy/jump-list)
      (:prefix "a"
        :nv "f" #'avy-goto-char-2
        :nv "m l" #'avy-move-line
        :nv "m r" #'avy-move-region
        :nv "k r" #'avy-kill-region
        :nv "k l" #'avy-kill-whole-line
        :nv "c r" #'avy-copy-region
        :nv "c l" #'avy-copy-line))

(map! :nmv "J" (lambda! (evil-next-line 5))
      :nmv "K" (lambda! (evil-previous-line 5)))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

