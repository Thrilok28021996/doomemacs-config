;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;; Disable UI elements early to reduce startup overhead.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Enable relative line numbers globally.
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'nill)

;; Set default font
;; (set-face-attribute 'default nil :family "Fira Code" :height 200)
(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 200)

;; 1) Ensure private‑use area (PUA) glyphs come from FiraCode Nerd Font
(set-fontset-font t
                  '(#xe000 . #xf8fff)   ;; covers U+E000…U+F8FF PUA block
                  (font-spec :family "FiraCode Nerd Font")
                  nil 'prepend)

;; 2) Also cover the 'symbol' script (some icons categorize there)
(set-fontset-font t 'symbol
                  (font-spec :family "FiraCode Nerd Font")
                  nil 'prepend)



;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;; Theme Configuration
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'macchiato) ; or 'frappe 'latte, 'macchiato, or 'mocha
(load-theme 'catppuccin t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
(use-package! conda
  :defer t
  :init (setq conda-anaconda-home (expand-file-name "~/miniconda3"))
  :config
  (conda-env-initialize-interactive-shells)
  (conda-env-initialize-eshell))

;; (after! python
;;   (setq-hook! 'python-mode-hook +format-with '(isort black)))
;; ;; Install via: M-x package-install RET ruff-format RET
;; (after! 'ruff-format)
;; (add-hook 'python-mode-hook 'ruff-format-on-save-mode)


;; (after! apheleia
;;   ;; 1. Define each formatter:
;;   (setf (alist-get 'isort apheleia-formatters)
;;         '("isort" "--stdout" "-"))              ; sort imports :contentReference[oaicite:5]{index=5}
;;   (setf (alist-get 'ruff apheleia-formatters)
;;         '("ruff" "format" "--stdin-filename" filepath)) ; format with Ruff :contentReference[oaicite:6]{index=6}
;;   (setf (alist-get 'black apheleia-formatters)
;;         '("black" "--quiet" "-"))              ; style with Black :contentReference[oaicite:7]{index=7}

;;   ;; 2. Chain them for Python buffers:
;;   (setf (alist-get 'python-mode apheleia-mode-alist)
;;         '(isort ruff black))                     ; run isort → ruff → black :contentReference[oaicite:8]{index=8}
;;   )
