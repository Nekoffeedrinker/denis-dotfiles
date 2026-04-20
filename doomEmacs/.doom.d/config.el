;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font
        (font-spec
         :family "Monaspace Xenon Frozen"
         :size 16 :weight 'regular)
      doom-variable-pitch-font
        (font-spec
         :family "Public Sans"
         :size 18)
      doom-serif-font
        (font-spec
         :family "Monaspace Argon Frozen"
         :size 16))

(custom-set-faces!
  '(italic
    :family "Monaspace Radon Frozen"
    :slant italic))

(use-package ligature
  :config
  (ligature-set-ligatures
   't   ; Para activarlo en todos los modos
   '(;; ss01 – Equality / comparison (JS-style)
     "===" "!==" "=!=" "=/=" "/==" "/=" "#="
     "==" "!=" "~~" "=~" "!~" "~-" "-~" "&="
     ;; ss02 – Relational
     ">=" "<="
     ;; ss03 – Arrows with tilde/dash
     "<-->" "<->" "<!--" "<--" "-->" "<-" "->"
     "<~>" "<~~" "~~>" "<~" "~>"
     ;; ss04 – XML / JSX
     "</" "/>" "</>" "<>"
     ;; ss05 – Pipe / functional (F#, Haskell)
     "[|" "|]" "/\\" "\\/" "|>" "<|" "<|>" "{|" "|}"
     ;; ss06 – Repeating operators
     "###" "+++" "&&&"
     ;; ss07 – Colon combinators
     "-:-" "=:=" ":>:" ":<:" "::>" "<::" "::" ":::"
     ;; ss08 – Dot operators
     "..=" "..-" "..<" ".=" ".-"
     ;; ss09 – Shift / fat arrows
     "<=>" "<<=" "=>>" "=<<" ">>=" "=>" "<<" ">>"
     ;; ss10 – Clojure / reader macros
     "#[" "#(" "#!["
     ;; liga – Spacing utilities
     "..." "///" "//" "!!" "||" ";;" ";;;"))
    (global-ligature-mode t))

(setq doom-theme 'catppuccin)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/Documents/Emacs/Notas")

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))
