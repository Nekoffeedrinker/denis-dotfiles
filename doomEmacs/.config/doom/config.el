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
                 (catppuccin-reload))))
  (setq! auto-dark-light-mode-hook
         (list (lambda ()
                 (setq catppuccin-flavor 'latte)
                 (catppuccin-reload))))
  (defun my-auto-dark-init-h ()
    (auto-dark-mode)
    (remove-hook 'server-after-make-frame-hook #'my-auto-dark-init-h)
    (remove-hook 'after-init-hook #'my-auto-dark-init-h))
  (let ((hook (if (daemonp)
                  'server-after-make-frame-hook
                'after-init-hook)))
    (add-hook hook #'my-auto-dark-init-h -95)))

(setq display-line-numbers-type 'relative)

;; Eliminar moviendo a la papelera
(setq delete-by-moving-to-trash t)

;; Abrir dirvish (dired pero mejor)
(map! :leader
      :desc "Dirvish" "o _" #'dirvish)

(add-hook! 'text-mode-hook
  (evil-local-set-key 'normal (kbd "j") #'evil-next-visual-line)
  (evil-local-set-key 'motion (kbd "j") #'evil-next-visual-line)
  (evil-local-set-key 'normal (kbd "k") #'evil-previous-visual-line)
  (evil-local-set-key 'motion (kbd "k") #'evil-previous-visual-line))

(setq org-directory "~/Documents/Emacs/Notas")

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
(setq! citar-bibliography '("~/Documents/Emacs/Roam/refs/referencias.bib"))

;; Decirle a orb dónde buscar las citas
(setq bibtex-completion-bibliography '("~/Documents/Emacs/Roam/refs/referencias.bib"))

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
