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
   '("--" "---" "==" "===" "!=" "!==" "=!="
     "=:=" "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++" "***" ";;" "!!"
     "??" "???" "?:" "?." "?=" "<:" ":<" ":>" ">:" "<:<" "<>" "<<<" ">>>"
     "<<" ">>" "||" "-|" "_|_" "|-" "||-" "|=" "||=" "##" "###" "####"
     "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#=" "^=" "<$>" "<$"
     "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</" "</>" "/>" "<!--" "<#--"
     "-->" "->" "->>" "<<-" "<-" "<=<" "=<<" "<<=" "<==" "<=>" "<==>"
     "==>" "=>" "=>>" ">=>" ">>=" ">>-" ">-" "-<" "-<<" ">->" "<-<" "<-|"
     "<=|" "|=>" "|->" "<->" "<~~" "<~" "<~>" "~~" "~~>" "~>" "~-" "-~"
     "~@" "[||]" "|]" "[|" "|}" "{|" "[<" ">]" "|>" "<|" "||>" "<||"
     "|||>" "<|||" "<|>" "..." ".." ".=" "..<" ".?" "::" ":::" ":=" "::="
     ":?" ":?>" "//" "///" "/*" "*/" "/=" "//=" "/==" "@_" "__" "???"
     "<:<" ";;;"))
  (global-ligature-mode t))

(setq doom-theme 'catppuccin)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/Documents/Emacs/Notas")

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))
