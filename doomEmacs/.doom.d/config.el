;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font
        (font-spec
         :family "MonaspiceXe Nerd Font Mono"
         :size 16 :weight 'regular)
      doom-variable-pitch-font
        (font-spec
         :family "Public Sans"
         :size 18)
      doom-serif-font
        (font-spec
         :family "MonaspiceAr Nerd Font Mono"
         :size 16))

(custom-set-faces!
  '(italic
    :family "MonaspiceRn Nerd Font Mono"
    :slant italic))

(setq doom-theme 'catppuccin)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/Documents/Emacs/Notas")

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))
