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
       ;;bidi              ; habilitar escritura derecha a izquierda
       ;;chinese
       ;;japanese
       ;;layout            ; layouts de teclado que no son QWERTY

       :completion
       ;;company           ; autocompletado de código avanzado
       (corfu +orderless)  ; completado con capf y orden flexible
       ;;helm              ; motor de búsqueda robusto y visual
       ;;ido               ; el motor de búsqueda clásico de emacs
       ;;ivy               ; búsqueda intereactiva ligera y potente
       vertico             ; motor de búsqueda moderno y minimalista

       :ui
       ;;deft              ; crear, Buscar y filtrar notas en texto plano
       doom                ; habilitar el aspecto visual de Doom Emacs
       dashboard           ; pantalla de bienvenida al abrir
       ;;doom-quit         ; mensajes de confirmación de salida graciosos
       ;;(emoji +unicode)  ; habiliar soporte de emogis
       hl-todo             ; resaltar TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ;;indent-guides     ; resaltar el identado usando columnas
       ;;ligatures         ; activar soporte para ligaduras y simbolos
       ;;minimap           ; mostrar un mapa del código en el lateral
       modeline            ; barra de estado inspirada en Atom
       ;;nav-flash         ; parpade a la línea del cursor al moverlo lejos
       ;;neotree           ; explorador de archivos lateral simple
       ophints             ; resalta el área de la última acción
       (popup +defaults)   ; gestión inteligente de ventanas temporales
       ;;smooth-scroll     ; desplazamiento suave (especialmente para trackpad)
       ;;tabs              ; barra de pestañas
       ;;treemacs          ; explorador de archivos lateral avanzado
       ;;unicode           ; activar soporte extendido para caracteres unicode
       (vc-gutter          ; indicar los cambios segun git en el margen derecho
        ;; +pretty
        )
       vi-tilde-fringe     ; poner `~` para líneas vacias al final (terminó el documento)
       ;;window-select     ; salto entre ventanas de manera visual (asignando letras o números)
       workspaces          ; activar función de workspases mediante TAB
       ;;zen               ; modo de escritura sin distracción

       :editor
       (evil +everywhere)  ; come to the dark side, we have cookies
       file-templates      ; auto-snippets for empty files
       fold                ; (nigh) universal code folding
       ;;(format +onsave)  ; automated prettiness
       ;;god               ; run Emacs commands without modifier keys
       ;;lispy             ; vim for lisp, for people who don't like vim
       ;;multiple-cursors  ; editing in many places at once
       ;;objed             ; text object editing for the innocent
       ;;parinfer          ; turn lisp into python, sort of
       ;;rotate-text       ; cycle region at point between text candidates
       snippets            ; my elves. They type so I don't have to
       (whitespace +guess +trim)  ; a butler for your whitespace
       ;;word-wrap         ; soft wrapping with language-aware indent

       :emacs
       dired               ; making dired pretty [functional]
       electric            ; smarter, keyword-based electric-indent
       ;;eww               ; the internet is gross
       ;;ibuffer           ; interactive buffer management
       tramp               ; remote files at your arthritic fingertips
       undo                ; persistent, smarter undo for your inevitable mistakes
       vc                  ; version-control and Emacs, sitting in a tree

       :term
       ;;eshell            ; the elisp shell that works everywhere
       ;;shell             ; simple shell REPL for Emacs
       ;;term              ; basic terminal emulator for Emacs
       ;;vterm             ; the best terminal emulation in Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       ;;(spell +flyspell) ; tasing you for misspelling mispelling
       ;;grammar           ; tasing grammar mistake every you make

       :tools
       ;;ansible
       ;;biblio            ; Writes a PhD for you (citation needed)
       ;;collab            ; buffers with friends
       ;;debugger          ; stepping through code, to help you add bugs
       ;;direnv
       ;;docker
       ;;editorconfig      ; let someone else argue about tabs vs spaces
       ;;ein               ; tame Jupyter notebooks with emacs
       (eval +overlay)     ; run code, run (also, repls)
       lookup              ; navigate your code and its documentation
       ;;llm               ; when I said you needed friends, I didn't mean...
       ;;(lsp +eglot)      ; M-x vscode
       magit               ; a git porcelain for Emacs
       ;;make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       ;;pdf               ; pdf enhancements
       ;;terraform         ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       ;;tree-sitter       ; syntax and parsing, sitting in a tree...
       ;;upload            ; map local to remote projects via ssh/ftp

       :os
       (:if (featurep :system 'macos) macos)  ; improve compatibility with macOS
       ;;tty               ; improve the terminal Emacs experience

       :lang
       ;;ada               ; In strong typing we (blindly) trust
       ;;(agda +local)     ; types of types of types of types...
       ;;beancount         ; mind the GAAP
       ;;(cc +lsp)         ; C > C++ == 1
       ;;clojure           ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .NET, and mono shenanigans
       ;;data              ; config/data formats
       ;;(dart +flutter)   ; paint ui and not much else
       ;;dhall
       ;;elixir            ; erlang done right
       ;;elm               ; care for a cup of TEA?
       emacs-lisp          ; drown in parentheses
       ;;erlang            ; an elegant language for a more civilized age
       ;;ess               ; emacs speaks statistics
       ;;factor
       ;;faust             ; dsp, but you get to keep your soul
       ;;fortran           ; in FORTRAN, GOD is REAL (unless declared INTEGER)
       ;;fsharp            ; ML stands for Microsoft's Language
       ;;fstar             ; (dependent) types and (monadic) effects and Z3
       ;;gdscript          ; the language you waited for
       ;;(go +lsp)         ; the hipster dialect
       ;;(graphql +lsp)    ; Give queries a REST
       ;;(haskell +lsp)    ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ; a language you can depend on
       ;;json              ; At least it ain't XML
       ;;janet             ; Fun fact: Janet is me!
       ;;(java +lsp)       ; the poster child for carpal tunnel syndrome
       ;;javascript        ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia             ; a better, faster MATLAB
       ;;kotlin            ; a better, slicker Java(Script)
       ;;latex             ; writing papers in Emacs has never been so fun
       ;;lean              ; for folks with too much to prove
       ;;ledger            ; be audit you can be
       ;;lua               ; one-based indices? one-based indices
       markdown            ; writing docs for people to ignore
       ;;nim               ; python + lisp at the speed of c
       ;;nix               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       ;;odin              ; C, minus its footguns
       org                 ; organize your plain life in plain text
       ;;php               ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       ;;graphviz          ; diagrams for confusing yourself even more
       ;;purescript        ; javascript, but functional
       ;;python            ; beautiful is better than ugly
       ;;qt                ; the 'cutest' gui framework ever
       ;;racket            ; a DSL for DSLs
       ;;raku              ; the artist formerly known as perl6
       ;;rest              ; Emacs as a REST client
       ;;rst               ; ReST in peace
       ;;(ruby +rails)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       ;;(rust +lsp)       ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;;scala             ; java, but good
       ;;(scheme +guile)   ; a fully conniving family of lisps
       sh                  ; she sells {ba,z,fi}sh shells on the C xor
       ;;sml
       ;;solidity          ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       ;;web               ; the tubes
       ;;yaml              ; JSON, but readable
       ;;zig               ; C, but simpler

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       ;;emms
       ;;everywhere        ; *leave* Emacs!? You must be joking
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader

       :config
       ;;literate
       (default +bindings +smartparens))
