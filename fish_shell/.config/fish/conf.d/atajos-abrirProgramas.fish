# ================================================
#     Alias y funciones para abrir programas
# ================================================

# -- Abrir Lazygit --
abbr lg lazygit

# -- Abrir emacs en la terminal --
alias temacs="emacsclient -nw -a 'emacs -nw'"

# -- Abrir yazi y usarlo para navegar --
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end
# Al salir de yazi con q, el directorio coincidirá con el abierto en yazi.
# Pero con S-q, el directorio será en el que estábamos cuando ejecutamos yazi.
# ------------------------------------------------

# -- Abrir algo y seguir usando la terminal --
function abrir
    nohup $argv &>/dev/null &
    disown
end
