;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Load personal modules
(load! "+javascript")


;; =============================================
;; ================ BOILERPLATE ================
;; =============================================

;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Gustav Holmsten"
      user-mail-address "gustav.holmsten@gmail.com")

;; (setq doom-font (font-spec :family "Hack Nerd Font" :size 15)
;;       doom-variable-pitch-font (font-spec :family "Hack Nerd Font"))

(setq doom-font (font-spec :family "Input" :size 16)
      doom-variable-pitch-font (font-spec :family "Input"))

;; Set theme
(setq doom-theme 'doom-one)

;; Make sure to use exec-path-from-shell when run as daemon
(when (daemonp)
  (exec-path-from-shell-initialize))

;; word-wrap in all text modes
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(setq ranger-override-dired-mode 'nil)
;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)
(setq scroll-margin 8)

;; To avoid using fundamental mode in textfiles.
(setq default-major-mode 'text-mode
      initial-major-mode 'text-mode)

;; =============================================
;; ============== CUSTOM FUNCTIONS =============
;; =============================================

(defun ediff-copy-both-to-C ()
  (interactive)
  (ediff-copy-diff ediff-current-difference nil 'C nil
                   (concat
                    (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                    (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
(defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "c" 'ediff-copy-both-to-C))
(add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)

(defun find-private-script ()
  "Search for a file in `~/scripts/'."
  (interactive)
  (doom-project-find-file "~/scripts/"))


(defun find-dotfile ()
  (interactive)
  (setq current-prefix-arg '(4))
  (doom-project-find-file "~/.config/"))

;; =============================================
;; ================ GLOBAL CONF ================
;; =============================================

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package wakatime-mode
  :diminish 'wakatime-mode
  :init
  (add-hook 'prog-mode-hook 'wakatime-mode)
  :config (progn (setq wakatime-cli-path "/usr/sbin/wakatime")
                 (setq wakatime-python-bin nil)
                 (setq global-wakatime-mode t)))

(custom-set-variables '(wakatime-api-key "4e468cc9-62d5-4197-9cf6-69b4f0109ee4"))

(use-package marginalia
  :after vertico
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

;; To get syntax higilighting
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.keymap\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.overlay\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.conf\\'" . conf-mode))
(add-to-list 'load-path (expand-file-name "~/.doom.d/lisp"))
(add-to-list 'custom-theme-load-path "~/.doom.d/themes")

;; Company autocomlpete
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)
(eval-after-load
    'company
    '(add-to-list 'company-backends 'company-omnisharp))

(add-hook 'csharp-mode-hook #'company-mode)

;; LSP configuration
(setq lsp-ui-doc 'nil)
(setq lsp-ui-doc-position 'at-point
      lsp-ui-doc-max-height 20
      lsp-ui-doc-max-width 150
      lsp-ui-sideline-diagnostic-max-line-length 140
      lsp-ui-sideline-diagnostic-max-lines 5)


(with-eval-after-load 'lsp-mode
  ;; :global/:workspace/:file
  (setq lsp-modeline-diagnostics-enable t)
  (setq lsp-modeline-diagnostics-scope :workspace))


;; =============================================
;; ================== WEB-DEV ==================
;; =============================================

(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

(eval-after-load
  'typescript-mode
  '(add-hook 'typescript-mode-hook #'add-node-modules-path))

(eval-after-load "web-mode"
  '(set-face-foreground 'web-mode-current-element-highlight-face "#091a54"))

(eval-after-load "web-mode"
  '(set-face-background 'web-mode-current-element-highlight-face "#bcbdc7"))

(setq lsp-clients-angular-language-server-command
  '("node"
    "/home/gustav/.nvm/versions/node/v14.16.0/lib/node_modules/@angular/language-server"
    "--ngProbeLocations"
    "/home/gustav/.nvm/versions/node/v14.16.0/lib/node_modules"
    "--tsProbeLocations"
    "/home/gustav/.nvm/versions/node/v14.16.0/lib/node_modules"
    "--stdio"))

(use-package! lsp-tailwindcss
  :init
  (setq lsp-tailwindcss-auto-install-server t)
  (setq lsp-tailwindcss-add-on-mode t)
  (setq lsp-tailwindcss-server-dir "/etc/lsp/tailwindcss/extensions/dist/server/")
  (setq lsp-tailwindcss-server-file "/etc/lsp/tailwindcss/extensions/dist/server/tailwindServer.js"))


;; =============================================
;; ================ KEY-BINDINGS ===============
;; =============================================

(map! :leader
      (:prefix "j"
        :nv "j" #'evil-jump-backward
        :nv "b" #'evil-jump-backward
        :nv "f" #'evil-jump-forward)
        ;; :nv "l" #'+ivy/jump-list)
      (:prefix "l"
        :nv "f" #'lsp-ui-sideline-apply-code-actions
        :nv "r" #'lsp-ui-peek-find-references
        :nv "g" #'lsp-ui-doc-glance
        :nv "d" #'lsp-ui-peek-find-implementation
        :nv "e" #'tide-goto-error
        :nv "s d" #'lsp-ui-doc-show
        :nv "s r" #'lsp-rename)
      (:prefix "ö"
        :nv "p s" #'persp-switch
        :nv "f f" #'counsel-fzf
        ;; :nv "f w" #'+ivy/project-search
        :nv "w h" #'evil-window-move-far-left
        :nv "w j" #'evil-window-move-very-bottom
        :nv "w k" #'evil-window-move-very-top
        :nv "w l" #'evil-window-move-far-right)
      (:prefix "v"
        :nv "f" #'vimish-fold-toggle
        :nv "c f" #'vimish-fold-avy
        :nv "n f" #'vimish-fold-next-fold
        :nv "t a" #'vimish-fold-toggle-all
        :nv "u a" #'vimish-fold-unfold-all
        :nv "r a" #'vimish-fold-refold-all)
      (:prefix "w"
       :n "SPC" #'winsize-incremental-resize)
      (:prefix "f"
       :n "s" #'find-private-script
       :n "c" (lambda ()
                     (interactive)
                     (setq current-prefix-arg '(4))
                     (find-dotfile)))
      (:prefix "k"
        :nv "k r" #'avy-kill-region
        :nv "k l" #'avy-kill-whole-line)
      (:prefix "m"
        :nv "m l" #'avy-move-line
        :nv "m r" #'avy-move-region)
      (:prefix "y"
        ;; :nv "f" #'avy-goto-char-2
        :nv "c r" #'avy-copy-region
        :nv "c l" #'avy-copy-line))

(map! :nv "f" #'nil
      :nv "f" #'avy-goto-char-2)

(map! :nmv "J" (cmd! (evil-next-line 5))
      :nmv "K" (cmd! (evil-previous-line 5)))

;; =============================================
;; ================ SAFEKEEPING ================
;; =============================================

;; (defun set-background-for-terminal (&optional frame)
;;   (or frame (setq frame (selected-frame)))
;;   "unsets the background color in terminal mode"
;;   (unless (display-graphic-p frame)
;;     (set-face-background 'default "unspecified-bg" frame)))
;; (add-hook 'after-make-frame-functions 'set-background-for-terminal)
;; (add-hook 'window-setup-hook 'set-background-for-terminal)

     ;; (setq evil-motion-state-cursor 'box)  ; █
     ;; (setq evil-visual-state-cursor 'box)  ; █
     ;; (setq evil-normal-state-cursor 'box)  ; █
     ;; (setq evil-insert-state-cursor 'bar)  ; ⎸
     ;; (setq evil-emacs-state-cursor  'hbar) ; _

;; Enable vertico
;; (use-package vertico
  ;; :custom
  ;; (vertico--cycle t)
  ;; :init
  ;; (vertico-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
;; (use-package savehist
;;   :init
;;   (savehist-mode))

;; ;; Use the `orderless' completion style. Additionally enable
;; ;; `partial-completion' for file path expansion. `partial-completion' is
;; ;; important for wildcard support. Multiple files can be opened at once
;; ;; with `find-file' if you enter a wildcard. You may also give the
;; ;; `initials' completion style a try.
;; (use-package orderless
;;   :init
;;   (setq completion-styles '(substring orderless)
;;         completion-category-defaults nil
;;         completion-category-overrides '((file (styles partial-completion)))))

;; =============================================
;; ==================== DOCS ===================
;; =============================================
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

