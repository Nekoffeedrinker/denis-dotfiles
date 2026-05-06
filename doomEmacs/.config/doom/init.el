;;; init.el -*- lexical-binding: t; -*-

;; Este archivo controla qué modulos de Doom son habilitados y en qué
;; orden se cargan. Recuerda usar 'doom sync' después de modificar

;; NOTE: Usa 'SPC h d h' (o 'C-h d h') para acceder a la documentación
;;   de Doom. Ahí podrás encontrar un enlace al índice de módulos donde
;;   todos los módulos están listados, incluyendo qué /flags/ soportan.

;; NOTE: Mueve el cursor sobre el nombre de un módulo (o su flag) y
;;   presiona K (o C-c c k) para ver su documentación. Esto funciona
;;   en flags también (los símbolos que inician con el signo más).
;;
;;   Alternativamente, presiona 'gd' (o 'C-c c gd') en un módulo para
;;   buscar su directorio (para acceso fácil a su código fuente).

(doom! :input
       ;; bidi              ; habilitar escritura derecha a izquierda
       ;; chinese
       ;; japanese
       ;; layout            ; layouts de teclado que no son QWERTY

       :completion
       ;; company           ; autocompletado de código avanzado
       (corfu +orderless)   ; completado con capf y orden flexible
       ;; helm              ; motor de búsqueda robusto y visual
       ;; ido               ; el motor de búsqueda clásico de emacs
       ;; ivy               ; búsqueda intereactiva ligera y potente
       vertico              ; motor de búsqueda moderno y minimalista

       :ui
       ;; deft              ; crear, Buscar y filtrar notas en texto plano
       doom                 ; habilitar el aspecto visual de Doom Emacs
       dashboard            ; pantalla de bienvenida al abrir
       doom-quit         ; mensajes de confirmación de salida graciosos
       (emoji +unicode)  ; habiliar soporte de emogis
       hl-todo              ; resaltar TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       indent-guides     ; resaltar el identado usando columnas
       ligatures         ; activar soporte para ligaduras y simbolos
       ;; minimap           ; mostrar un mapa del código en el lateral
       modeline             ; barra de estado inspirada en Atom
       ;; nav-flash         ; parpade a la línea del cursor al moverlo lejos
       ;; neotree           ; explorador de archivos lateral simple
       ophints              ; resalta el área de la última acción
       (popup +defaults)    ; gestión inteligente de ventanas temporales
       smooth-scroll     ; desplazamiento suave (especialmente para trackpad)
       ;; tabs              ; barra de pestañas
       treemacs          ; explorador de archivos lateral avanzado
       ;; unicode           ; activar soporte extendido para caracteres unicode
       (vc-gutter           ; indicar los cambios segun git en el margen derecho
        ;;  +pretty
        )
       vi-tilde-fringe      ; poner `~` para líneas vacias al final (terminó el documento)
       ;; window-select     ; salto entre ventanas de manera visual (asignando letras o números)
       workspaces           ; activar función de workspases mediante TAB
       zen               ; modo de escritura sin distracción

       :editor
       (evil +everywhere)   ; movimientos de vim en todo emacs
       file-templates       ; plantillas automáticas para arcivos nuevos
       fold                 ; plegar bloques de código
       (format +onsave)  ; autoformateo al guardar
       ;; god               ; ejecutar atajos emacs sin las teclas modificadoras
       ;; lispy             ; edita y organiza lisp usando teclas rápidas como en vim
       ;; multiple-cursors  ; utilizar múltiples cursores
       ;; objed             ; edición basada en 'objetos de texto'
       ;; parinfer          ; en lisp pone paréntesis autoáticamente según la sangría
       ;; rotate-text       ; alterna entre palabras opuestas o relacionadas
       snippets             ; plantillas de código reutilizables
       (whitespace +guess +trim)  ; detecta el estilo de identado y limpia el final de linea
       word-wrap         ; activar el ajuste de línea (sin romper palabras)

       :emacs
       dired                ; explorador y gestor de archivos visual y potente
       electric             ; identación automática inteligente
       ;; eww               ; navegador web dentro de emacs (solo texto)
       ;; ibuffer           ; gestión interactiva y avanzada de buffers
       tramp                ; edición de archivos remotos por ssh
       undo                 ; historial de cambios persistente
       vc                   ; interfaz estándar para control de versiones

       :term
       eshell            ; shell scrita puramnete en elisp
       ;; shell             ; consla de comandos simple basada en texto (REPL)
       ;; term              ; emulador de terminal básico
       vterm             ; terminal con emulación completa (mejor que term)

       :checkers
       syntax               ; chequeo de sintaxis en tiempo real
       (spell +flyspell) ; corrector ortográfico al vuelo
       ;; grammar           ; correción gramatical avanzada

       :tools
       ;; ansible
       biblio            ; gestión de bibliografías y citas
       ;; collab            ; gestión colaborativa en tiempo real
       ;; debugger          ; depurador de código integrado
       ;; direnv
       ;; docker
       ;; editorconfig      ; sincroniza el estilo de código con otros editores
       ;; ein               ; integración con jupyter notebooks
       (eval +overlay)      ; evaluación de código en línea
       lookup               ; búsqueda de definiciones y documentación
       ;; llm               ; integración con modelos de lenguaje (IA)
       (lsp +eglot)      ; soporte para LSP (Languaje Server Protocol)
       magit                ; a git porcelain for Emacs
       ;; make              ; ejecución de Make tasks
       ;; pass              ; gestión de contraseñas dentro de emacs
       pdf               ; visor de PDF mejorado
       ;; terraform         ; sintaxis y ejecución de comandos Hcl
       ;; tmux              ; API para integrar sesiones tmux
       tree-sitter       ; parseo rápido para mejor resaltado
       ;; upload            ; subida de archivos via ssh/ftp

       :os
       (:if (featurep :system 'macos) macos)  ; mejoras para macOS
       ;; tty               ; mejor experiencia en terminal tty

       :lang
       ;; ada               ; In strong typing we (blindly) trust
       ;; (agda +local)     ; types of types of types of types...
       ;; beancount         ; mind the GAAP
       ;; (cc +lsp)         ; C > C++ == 1
       ;; clojure           ; java with a lisp
       ;; common-lisp       ; if you've seen one lisp, you've seen them all
       ;; coq               ; proofs-as-programs
       ;; crystal           ; ruby at the speed of c
       ;; csharp            ; unity, .NET, and mono shenanigans
       ;; data              ; config/data formats
       ;; (dart +flutter)   ; paint ui and not much else
       ;; dhall
       ;; elixir            ; erlang done right
       ;; elm               ; care for a cup of TEA?
       emacs-lisp           ; drown in parentheses
       ;; erlang            ; an elegant language for a more civilized age
       ;; ess               ; emacs speaks statistics
       ;; factor
       ;; faust             ; dsp, but you get to keep your soul
       ;; fortran           ; in FORTRAN, GOD is REAL (unless declared INTEGER)
       ;; fsharp            ; ML stands for Microsoft's Language
       ;; fstar             ; (dependent) types and (monadic) effects and Z3
       ;; gdscript          ; the language you waited for
       ;; (go +lsp)         ; the hipster dialect
       ;; (graphql +lsp)    ; Give queries a REST
       ;; (haskell +lsp)    ; a language that's lazier than I am
       ;; hy                ; readability of scheme w/ speed of python
       ;; idris             ; a language you can depend on
       ;; json              ; At least it ain't XML
       ;; janet             ; Fun fact: Janet is me!
       ;; (java +lsp)       ; the poster child for carpal tunnel syndrome
       ;; javascript        ; all(hope(abandon(ye(who(enter(here))))))
       ;; julia             ; a better, faster MATLAB
       ;; kotlin            ; a better, slicker Java(Script)
       ;; latex             ; writing papers in Emacs has never been so fun
       ;; lean              ; for folks with too much to prove
       ;; ledger            ; be audit you can be
       ;; lua               ; one-based indices? one-based indices
       markdown             ; writing docs for people to ignore
       ;; nim               ; python + lisp at the speed of c

       (nix                 ; Archivos de Nix y NixOS
        +lsp
        +tree-sitter)

       ;; ocaml             ; an objective camel
       ;; odin              ; C, minus its footguns

       (org                 ; Archivos de texto plano con superpoderes
        +pretty             ; Mejorar el aspecto de org-mode
        +journal            ; Llevar un diario en org-mode
        +roam)              ; Conectar org-files como en Roam Research

       ;; php               ; perl's insecure younger brother
       ;; plantuml          ; diagrams for confusing people more
       ;; graphviz          ; diagrams for confusing yourself even more
       ;; purescript        ; javascript, but functional
       ;; python            ; beautiful is better than ugly
       ;; qt                ; the 'cutest' gui framework ever
       ;; racket            ; a DSL for DSLs
       ;; raku              ; the artist formerly known as perl6
       ;; rest              ; Emacs as a REST client
       ;; rst               ; ReST in peace
       ;; (ruby +rails)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       ;; (rust +lsp)       ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;; scala             ; java, but good
       ;; (scheme +guile)   ; a fully conniving family of lisps
       sh                   ; she sells {ba,z,fi}sh shells on the C xor
       ;; sml
       ;; solidity          ; do you need a blockchain? No.
       ;; swift             ; who asked for emoji variables?
       ;; terra             ; Earth and Moon in alignment for performance.
       ;; web               ; the tubes
       ;; yaml              ; JSON, but readable
       ;; zig               ; C, but simpler

       :email
       ;; (mu4e +org +gmail)
       ;; notmuch
       ;; (wanderlust +gmail)

       :app
       ;; calendar
       ;; emms              ; sistema multimedia para emacs
       ;; everywhere        ; usar emacs en cualquier caja de texto
       ;; irc               ; chat mediante protocolo IRC
       ;; (rss +org)        ; lector de noticias RSS con Org

       :config
       ;; literate         ; configuración en literario
       (default +bindings +smartparens)) ; cargar ajustes por defecto
