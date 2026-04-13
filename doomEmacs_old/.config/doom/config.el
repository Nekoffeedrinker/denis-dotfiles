;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Usar zsh
(setq shell-file-name "/bin/zsh")

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


;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))


; JetBrainsMono Nerd Font Mono
; Monaspace Xenon
; Iosevka Slab Extended

(setq doom-font (font-spec :family "Monaspace Xenon" :size 15 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Public Sans" :size 18))

(custom-set-faces!
  '(italic :family "Monaspace Radon" :slant italic))


;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-one)        ; Predeterminado


;; Algunos temas que estuve probando

;(setq doom-theme 'doom-palenight)  ; Predeterminado pero poquito mejor
;(setq doom-theme 'doom-nord)       ; Muy gris para mí
;(setq doom-theme 'doom-wilmersdorf)      ; El mejor org, pero lo demás lo resalta gris
;(setq doom-theme 'doom-spacegrey)      ; Muy gris, Buen naranja, pero no resalta org
;(setq doom-theme 'doom-moonlight)      ; Buen org, no me gusta el ambiente morado
;(setq doom-theme 'doom-opera-light) ; Tema claro
;(setq doom-theme 'doom-monokai-spectrum) ; Tema oscuro
;(setq doom-theme 'doom-monokai-pro) ; Tema oscuro
;(setq doom-theme 'doom-tokyo-night) ; Tema oscuro
;(setq doom-theme 'doom-oceanic-next) ; Tema oscuro


;; El tema con el que me quedé
;(setq doom-theme 'doom-flatwhite) ; Tema claro
;(setq doom-theme 'doom-tomorrow-day) ; Tema claro
;(setq doom-theme 'doom-material-dark) ; Tema oscuro
;(setq doom-theme 'doom-tomorrow-night) ; Buen color, org no me convence


;; Hacer cambiar tema según el sistema
(use-package! auto-dark
 :defer t
 :init
 ;; Configure themes
 (setq! auto-dark-themes '((doom-tomorrow-night) (doom-tomorrow-day))) ; Oscuro / Claro
 ;; Disable doom's theme loading mechanism (just to make sure)
 (setq! doom-theme nil)
 ;; Declare that all themes are safe to load.
 ;; Be aware that setting this variable may have security implications if you
 ;; get tricked into loading untrusted themes (via auto-dark-mode or manually).
 ;; See the documentation of custom-safe-themes for details.
 (setq! custom-safe-themes t)
 ;; Enable auto-dark-mode at the right point in time.
 ;; This is inspired by doom-ui.el. Using server-after-make-frame-hook avoids
 ;; issues with an early start of the emacs daemon using systemd, which causes
 ;; problems with the DBus connection that auto-dark mode relies upon.
 (defun my-auto-dark-init-h ()
   (auto-dark-mode)
   (remove-hook 'server-after-make-frame-hook #'my-auto-dark-init-h)
   (remove-hook 'after-init-hook #'my-auto-dark-init-h))
 (let ((hook (if (daemonp)
                 'server-after-make-frame-hook
               'after-init-hook)))
   ;; Depth -95 puts this before doom-init-theme-h, which sounds like a good
   ;; idea, if only for performance reasons.
   (add-hook hook #'my-auto-dark-init-h -95)))


;; Cambiar algunos colores específicos
(custom-set-faces!

  ;; Encabezados de org
;  '(org-level-1 :foreground "#819cd6")
;  '(org-level-2 :foreground "#5b94ab")
;  '(org-level-3 :foreground "#7ebebd")
;  '(org-level-4 :foreground "#677db5")
;  '(org-level-5 :foreground "#497888")
;  '(org-level-6 :foreground "#629897")
;  '(org-level-7 :foreground "#505e88")
;  '(org-level-8 :foreground "#395c69")

  ;; Dias en los que sí hay entrada de diario
  '(org-journal-calendar-entry-face :foreground "#5b9b6e")
  )




;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/Emacs/Notas/")

;; Org agenda con roam
(setq org-agenda-files (list org-directory "~/Documents/Emacs/Roam/" "~/Documents/Emacs/Roam/journal/"))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;

;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
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



;; -----------------------------------------------------------------------------
;; ------------------------ Configuraciones personales ------------------------
;; -----------------------------------------------------------------------------

;; Definir el tamaño de la ventana al iniciar
(add-hook 'emacs-startup-hook
  (lambda ()
    (when (display-graphic-p)
      (set-frame-size (selected-frame) 90 40)  ;; Ancho y alto en caracteres
      (set-frame-position (selected-frame) 100 50))))  ;; Posición en píxeles

;; Abrir emacs maximizado
;(add-hook 'window-setup-hook 'toggle-frame-maximized)

;; Cambiar el banner de la pantalla de bienvenida
(setq fancy-splash-image (concat doom-private-dir "assets/emacs-e-logo(naranja).png"))


;; Opciones del editor -------------------------------------

;; Activar paréntesis de colores
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'text-mode-hook #'rainbow-delimiters-mode)

;; Ennumerar lineas relativamente
(setq display-line-numbers-type 'relative)

;; Activar el modo abreviado
(add-hook 'text-mode-hook #'abbrev-mode)
;(add-hook 'typst-mode-hook #'abbrev-mode)

;; Diccionario personal
(setq ispell-personal-dictionary "~/.config/doom/mis-palabras.pws")

;; Configurar la detección del lenguaje automático
;(use-package! guess-language
;  :hook (text-mode . guess-language-mode)
;  :config
;  (setq guess-language-languages '(es en)
;        guess-language-min-paragraph-length 35))

;; Configurar Languajetool
(use-package! langtool
  :config
  (setq langtool-http-server-host "localhost"
        langtool-http-server-port 8081))
(setq langtool-mother-tongue "es")


;; Hooks para org y markdown

(add-hook 'org-mode-hook (lambda ()
  (auto-fill-mode 1)
  (setq-local fill-column 80)
  (setq-local word-wrap nil)))
(after! markdown-mode
  (add-hook 'markdown-mode-hook #'variable-pitch-mode)
  (add-hook 'markdown-mode-hook #'visual-fill-column-mode)
  (setq visual-fill-column-width 80))

;: Navegar entre lineas visuales
(add-hook! 'text-mode-hook
  (evil-local-set-key 'normal (kbd "j") #'evil-next-visual-line)
  (evil-local-set-key 'motion (kbd "j") #'evil-next-visual-line)
  (evil-local-set-key 'normal (kbd "k") #'evil-previous-visual-line)
  (evil-local-set-key 'motion (kbd "k") #'evil-previous-visual-line))

;; Intercambiar lineas como vscode
; (defun my/move-line-down ()
;   (interactive)
;   (forward-line 1)
;   (transpose-lines 1)
;   (forward-line -1))
; (defun my/move-line-up ()
;   (interactive)
;   (transpose-lines 1)
;   (forward-line -2))
; (map! :n "M-<down>" #'my/move-line-down
;       :n "M-<up>"   #'my/move-line-up)


;; Eliminar moviendo a la papelera
(setq delete-by-moving-to-trash t)

;; Abrir dirvish (dired pero mejor)
(map! :leader
      :desc "Dirvish" "o _" #'dirvish)

;; Configurar Org-Jorunal ----------------------------------
(setq org-journal-dir "~/Documents/Emacs/Diario/"
      org-journal-date-prefix "#+title: "
      org-journal-time-prefix "\n* "
      org-journal-date-format "%A, %d/%b/%Y"
      org-journal-file-format "%Y-%m-%d.org")


;; Atajo para abrir el calendario
(map! (:leader :desc "Abrir calendario" "n j d" #'calendar))

;; Abrir el calendario sin evil mode
(add-hook 'calendar-mode-hook #'evil-emacs-state)

;; Atajos del calendario en evil mode (no funcionan bien)
;(map!  (:map calendar-mode-map
;       :n "d" #'org-journal-display-entry
;       :n "D" #'org-journal-read-entry
;       :n "p" #'org-journal-previous-entry
;       :n "n" #'org-journal-next-entry
;       :n "u" nil
;       :n "x" nil))



;; Configurar Org-Roam -------------------------------------
(setq org-roam-directory "~/Documents/Emacs/Roam"
      org-roam-dailies-directory "journal/"
      org-roam-graph-viewer
      (lambda (file)
        (start-process "min" nil "/usr/bin/min"
                       (concat "file://" file))))

;; Ajustes de refile para usarlo con roam.
(setq org-refile-targets
      `(("~/Documents/Emacs/Notas/Inbox.org" :maxlevel . 2)
        (,(directory-files "~/Documents/Emacs/Roam/" t "\\.org$") :maxlevel . 2)))


;; Org Roam Bibtex (orb) ---------

;; Decirle a 'citar' dónde está la bibliografía (necesario para orb)
(setq! citar-bibliography '("~/Documents/Emacs/Roam/refs/referencias.bib"))

;; Activar orb luego de que cargue org-roam
(use-package! org-roam-bibtex
  :after org-roam
  :config
  (org-roam-bibtex-mode 1))

;; indicarle el formato e interfaz de citas a orb
(setq orb-roam-ref-format 'org-cite)
(setq orb-insert-interface 'citar)

;; Decirle a orb dónde buscar las citas
(setq bibtex-completion-bibliography '("~/Documents/Emacs/Roam/refs/referencias.bib"))

;; Crear un atajo para crear una nota de una bibliografía
(map! :leader
      (:prefix ("n r" . "+roam")
       :desc "Crear una nota de bibliografía" "b" #'orb-insert-link))


;; --- Configurar Typst ------------------------------------

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
  (setq typst-preview-executable "/home/denis/.config/emacs/.local/cache/.cache/lsp/tinymist/tinymist")
  (setq typst-preview-browser "default")
  (setq browse-url-browser-function 'browse-url-generic)
  (setq browse-url-generic-program "/usr/bin/min"))

;; Insertar citas de forma facil
(defun dp/citar-insert-typst-normal ()
  (interactive)
  (let ((key (car (citar-select-refs))))
    (insert (concat "#cite(<" key ">, form: \"normal\")"))))
(defun dp/citar-insert-typst-prose ()
  (interactive)
  (let ((key (car (citar-select-refs))))
    (insert (concat "#cite(<" key ">, form: \"prose\")"))))

;; -----------------------------------------------------------------------------

;; Arduino

(use-package! arduino-mode
  :mode "\\.ino\\'"
  :hook (arduino-mode . eglot-ensure))

(defun dp/arduino-gen-compile-db ()
  (interactive)
  (let ((default-directory (file-name-directory (buffer-file-name)))
        (process-environment (cons "PATH=/home/linuxbrew/.linuxbrew/bin:/usr/bin:/bin" process-environment)))
    (let ((proc (start-process-shell-command
                 "arduino-gen-db" "*arduino-gen-db*"
                 "arduino-cli compile --only-compilation-database -b esp32:esp32:esp32 --build-path /tmp/arduino-build . && cp /tmp/arduino-build/compile_commands.json .")))
      (set-process-sentinel proc
        (lambda (p _)
          (when (eq (process-status p) 'exit)
            (kill-buffer "*arduino-gen-db*")
            (if (eq (process-exit-status p) 0)
                (message "✓ compile_commands.json generado")
              (message "✗ Error al generar compile_commands.json"))))))))

(defun dp/arduino-gen-clangd ()
  (interactive)
  (let ((clangd-file (expand-file-name ".clangd" (file-name-directory (buffer-file-name)))))
    (with-temp-file clangd-file
      (insert "CompileFlags:\n  Remove: [-m*, -f*, \"@*\"]\n"))
    (message "✓ .clangd generado")))
