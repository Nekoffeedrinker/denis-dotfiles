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
     ;; "</" "/>" "</>" "<>"
     ;; ss05 – Pipe / functional (F#, Haskell)
     ;; "[|" "|]" "/\\" "\\/" "|>" "<|" "<|>" "{|" "|}"
     ;; ss06 – Repeating operators
     ;; "###" "+++" "&&&"
     ;; ss07 – Colon combinators
     ;; "-:-" "=:=" ":>:" ":<:" "::>" "<::" "::" ":::"
     ;; ss08 – Dot operators
     ;; "..=" "..-" "..<" ".=" ".-"
     ;; ss09 – Shift / fat arrows
     "<=>" "<<=" "=>>" "=<<" ">>=" "=>" "<<" ">>"
     ;; ss10 – Clojure / reader macros
     ;; "#[" "#(" "#!["
     ;; liga – Spacing utilities
     "..." "///" "//" "!!" "||" ";;" ";;;"))
    (global-ligature-mode t))

;; (setq doom-theme 'catppuccin)

(use-package! auto-dark
  :defer t
  :init
  ;; Usamos catppuccin en ambos slots; el flavor cambia vía hooks
  (setq! auto-dark-themes '((catppuccin) (catppuccin)))
  ;; Disable doom's theme loading mechanism (just to make sure)
  (setq! doom-theme nil)
  ;; Declare that all themes are safe to load.
  (setq! custom-safe-themes t)
  ;; Hooks para cambiar el flavor según el modo del sistema
  (setq! auto-dark-dark-mode-hook
         (list (lambda ()
                 (setq catppuccin-flavor 'mocha)
                 (catppuccin-reload)
                 (my/org-faces-mocha)))) ; <- fragmento agregado
  (setq! auto-dark-light-mode-hook
         (list (lambda ()
                 (setq catppuccin-flavor 'latte)
                 (catppuccin-reload)
                 (my/org-faces-latte)))) ; <- fragmento agregado
  (defun my-auto-dark-init-h ()
    (auto-dark-mode)
    (remove-hook 'server-after-make-frame-hook #'my-auto-dark-init-h)
    (remove-hook 'after-init-hook #'my-auto-dark-init-h))
  (let ((hook (if (daemonp)
                  'server-after-make-frame-hook
                'after-init-hook)))
    (add-hook hook #'my-auto-dark-init-h -95)))

(setq display-line-numbers-type 'relative)

(setq confirm-kill-emacs nil)

;; Eliminar moviendo a la papelera
(setq delete-by-moving-to-trash t)

;; Abrir dirvish (dired pero mejor)
(map! :leader
      :desc "Dirvish" "o _" #'dirvish)

(with-eval-after-load "ispell"
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "es_MX,en_US")
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "es_MX,en_US"))

(setq ispell-personal-dictionary "~/Emacs-things/mis-palabras.pws")

(use-package! langtool
  :config
  (setq langtool-http-server-host "localhost"
        langtool-http-server-port 8081))
(setq langtool-mother-tongue "es")

(add-hook! 'text-mode-hook
  (evil-local-set-key 'normal (kbd "j") #'evil-next-visual-line)
  (evil-local-set-key 'motion (kbd "j") #'evil-next-visual-line)
  (evil-local-set-key 'normal (kbd "k") #'evil-previous-visual-line)
  (evil-local-set-key 'motion (kbd "k") #'evil-previous-visual-line))

(setq org-directory "~/Documents/Emacs/Notas")

(defun my/org-faces-latte ()
  (custom-set-faces!
    '(org-level-1 :foreground "#d20f39" :height 1.2 :bold t)
    '(org-level-2 :foreground "#fe640b" :height 1.2 :bold nil)
    '(org-level-3 :foreground "#df8e1d" :height 1.1 :bold t)
    '(org-level-4 :foreground "#40a02b" :height 1.1 :bold nil)
    '(org-level-5 :foreground "#209fb5" :height 1.0 :bold t)
    '(org-level-6 :foreground "#7287fd" :height 1.0 :bold t)
    '(org-level-7 :foreground "#8839ef" :height 1.0 :bold t)
    '(org-level-8 :foreground "#e64553" :height 1.0 :bold nil)
    '(org-document-title :height 1.3 :bold t :underline nil)))

(defun my/org-faces-mocha ()
  (custom-set-faces!
    '(org-level-1 :foreground "#f38ba8" :height 1.2 :bold t)
    '(org-level-2 :foreground "#fab387" :height 1.2 :bold nil)
    '(org-level-3 :foreground "#f9e2af" :height 1.1 :bold t)
    '(org-level-4 :foreground "#a6e3a1" :height 1.1 :bold nil)
    '(org-level-5 :foreground "#74c7ec" :height 1.0 :bold t)
    '(org-level-6 :foreground "#b4befe" :height 1.0 :bold t)
    '(org-level-7 :foreground "#cba6f7" :height 1.0 :bold t)
    '(org-level-8 :foreground "#eba0ac" :height 1.0 :bold nil)
    '(org-document-title :height 1.3 :bold t :underline nil)))

(setq org-agenda-files
      (list org-directory
            "~/Documents/Emacs/Notas/ToDo/"
            "~/Documents/Emacs/Roam/"
            "~/Documents/Emacs/Roam/journal/"))

(setq org-log-into-drawer t)

(use-package! org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :config (setq org-fancy-priorities-list '("❗" "⬆" "⬇")))

(setq org-journal-dir "~/Documents/Emacs/Diario/"
      org-journal-date-prefix "#+title: "
      org-journal-time-prefix "\n* "
      org-journal-date-format "%A, %d/%b/%Y"
      org-journal-file-format "%Y-%m-%d.org")

(setq org-roam-directory "~/Documents/Emacs/Roam"
      org-roam-dailies-directory "journal/")

(setq org-roam-graph-viewer
      (lambda (file)
        (start-process "min" nil "/usr/bin/min"
                       (concat "file://" file))))

(setq org-refile-targets
      `(("~/Documents/Emacs/Notas/Inbox.org" :maxlevel . 2)
        (,(directory-files "~/Documents/Emacs/Roam/" t "\\.org$") :maxlevel . 2)))

;; Decirle a 'citar' dónde está la bibliografía (necesario para orb)
(setq! citar-bibliography '("~/Emacs-things/referencias.bib"))

;; Decirle a orb dónde buscar las citas
(setq bibtex-completion-bibliography '("~/Emacs-things/referencias.bib"))

;; Activar orb luego de que cargue org-roam
(use-package! org-roam-bibtex
  :after org-roam
  :config
  (org-roam-bibtex-mode 1))

;; indicarle el formato e interfaz de citas a orb
(setq orb-roam-ref-format 'org-cite)
(setq orb-insert-interface 'citar)

;; Crear un atajo para crear una nota de una bibliografía
(map! :leader
      (:prefix ("n r" . "+roam")
       :desc "Crear una nota de bibliografía" "b" #'orb-insert-link))

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

;; Asociar los archivos
(add-to-list 'auto-mode-alist '("\\.typ\\'" . typst-ts-mode))

;; Decirle a org que Typst existe
(with-eval-after-load 'org
  (add-to-list 'org-src-lang-modes '("typst" . typst-ts)))

;; Activar Elgot
(add-hook 'typst-ts-mode-hook #'eglot-ensure)

;; Configurar Elgot para typst
(with-eval-after-load 'eglot
  (with-eval-after-load 'typst-ts-mode
    (add-to-list 'eglot-server-programs
                 `((typst-ts-mode) .
                   ,(eglot-alternatives `(,typst-ts-lsp-download-path
                                          "tinymist"))))))

;; hacer que los tabs sean de 2 (igual que el formatter)
(after! typst-ts-mode
  (setq typst-ts-mode-indent-offset 2)
  (setq typst-ts-indent-offset 2))

;; Hacer funcionar typst-preview
(use-package! typst-preview
  :config
  (setq typst-preview-executable "/run/current-system/sw/bin/tinymist")
  (setq typst-preview-browser "default")
  ;; Utilzar Gnome Web
  (setq browse-url-browser-function 'browse-url-generic)
  (setq browse-url-generic-program "/run/current-system/sw/bin/epiphany")
)

;; Insertar citas de forma facil
(defun dp/citar-insert-typst-normal ()
  (interactive)
  (let ((key (car (citar-select-refs))))
    (insert (concat "#cite(<" key ">, form: \"normal\")"))))
(defun dp/citar-insert-typst-prose ()
  (interactive)
  (let ((key (car (citar-select-refs))))
    (insert (concat "#cite(<" key ">, form: \"prose\")"))))

;; Configurar Elgot para nixd
(after! eglot
  (add-to-list 'eglot-server-programs
               '((nix-mode nix-ts-mode) . ("nixd"))))

;; Configurar el alejandra como tree-sitter
(after! nix-mode
  (setq nix-nixfmt-bin "alejandra"))
(after! nix-ts-mode
  (set-formatter! 'alejandra "alejandra" :modes '(nix-ts-mode nix-mode)))

(use-package! kdl-mode
  :mode "\\.kdl\\'")
