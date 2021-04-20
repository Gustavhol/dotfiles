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
(setq doom-font (font-spec :family "Hack Nerd Font" :size 14)
      doom-variable-pitch-font (font-spec :family "Hack Nerd Font"))

;; Make sure to use exec-path-from-shell when run as daemon
(when (daemonp)
  (exec-path-from-shell-initialize))

;; word-wrap in all text modes
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(eval-after-load
  'typescript-mode
  '(add-hook 'typescript-mode-hook #'add-node-modules-path))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

(setq ranger-override-dired-mode t)
(add-hook 'daemonp 'exec-path-from-shell-initialize)

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)
(setq scroll-margin 8)

;; To avoid using fundamental mode in textfiles.
(setq default-major-mode 'text-mode
      initial-major-mode 'text-mode)

(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

(eval-after-load "web-mode"
  '(set-face-foreground 'web-mode-current-element-highlight-face "#091a54"))

(eval-after-load "web-mode"
  '(set-face-background 'web-mode-current-element-highlight-face "#bcbdc7"))

;; Company autocomlpete
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)

;; To get syntax higilighting
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.keymap\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.overlay\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.conf\\'" . conf-mode))
(add-to-list 'load-path (expand-file-name "~/.doom.d/lisp"))
(add-to-list 'custom-theme-load-path "~/.doom.d/themes")

(add-hook 'markdown-mode-hook 'grip-mode)
(add-hook 'org-mode-hook 'grip-mode)
(add-hook 'c-mode-hook 'irony-mode)

(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
(defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "c" 'ediff-copy-both-to-C))
(add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)

;; LSP configuration
(setq lsp-ui-doc nil)
(setq lsp-ui-doc-position 'at-point
      lsp-ui-doc-max-height 150
      lsp-ui-sideline-diagnostic-max-line-length 140
      lsp-ui-sideline-diagnostic-max-lines 5
      lsp-ui-doc-max-width 150
      lsp-headerline-breadcrumb-enable t)

(setq lsp-clients-angular-language-server-command
  '("node"
    "/home/gustav/.nvm/versions/node/v14.16.0/lib/node_modules/@angular/language-server"
    "--ngProbeLocations"
    "/home/gustav/.nvm/versions/node/v14.16.0/lib/node_modules"
    "--tsProbeLocations"
    "/home/gustav/.nvm/versions/node/v14.16.0/lib/node_modules"
    "--stdio"))

;; Keymaps
(map! :leader
      (:prefix "j"
        :nv "j" #'evil-jump-backward
        :nv "b" #'evil-jump-backward
        :nv "f" #'evil-jump-forward
        :nv "l" #'+ivy/jump-list
        )
      (:prefix "t"
        :nv "f" #'lsp-ui-sideline-apply-code-actions
        :nv "r" #'lsp-find-references
        :nv "d" #'lsp-ui-peek-find-implementation
        :nv "e" #'tide-goto-error
        :nv "b" #'evil-jump-backward
        :nv "s d" #'lsp-ui-doc-show
        :nv "s r" #'lsp-rename)
      (:prefix "ö"
       :nv "b f" #'bool-flip-do-flip
        :nv "p s" #'persp-switch
        :nv "f f" #'counsel-fzf
        :nv "f w" #'+ivy/project-search
        :nv "w h" #'evil-window-move-far-right
        :nv "w v" #'evil-window-move-very-top
        :nv "w j" #'evil-window-decrease-height
        :nv "w k" #'evil-window-increase-height)
      (:prefix "z"
       :nv "n" #'neuron-insert-new-zettel
       :nv "i l" #'neuron-insert-zettel-link
       :nv "c" #'neuron-create-zettel-from-selected-title)

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

(map! :nv "f" #'nil
      :nv "f" #'avy-goto-char-2)

(map! :nmv "J" (cmd! (evil-next-line 5))
      :nmv "K" (cmd! (evil-previous-line 5)))

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

