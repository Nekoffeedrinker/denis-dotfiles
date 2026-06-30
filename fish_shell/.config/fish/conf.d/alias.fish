# === === Listar directorios === ===

alias eza='eza --color=always --icons=always --git'
alias ezal='eza -l --no-permissions --no-filesize --no-user --no-time'

abbr ls eza
abbr lsa eza -a
abbr ll eza -lg
abbr lla eza -lga
abbr l ezal
abbr la ezal -a

abbr tree eza -T

# === === Leer archivos de texto plano === ===

alias cat='bat'
abbr catt cat -P # bat sin pager
abbr bat cat -pp # bat sin pager ni decoraciones

# === === Uso de Git === ===

abbr gs git status
abbr gd git diff
abbr gds git diff --staged
abbr gdd git -c delta.features=side-by-side diff
abbr gdds git -c delta.features=side-by-side diff --staged
abbr ga git add
abbr gc git commit
abbr gca git commit --amend
abbr gce git commit --amend --no-edit
abbr gl git log --oneline --graph --all
abbr gll git log

# -- Abrir Lazygit --
abbr lg lazygit

# -- Locuras --

# fzf + bat + nvim
alias fvim='nvim $(fzf -m --preview="bat -p {}")'

# ============================== Funciones ==============================

# -- Abrir algo y seguir usando la terminal --
function abrir
    nohup $argv &>/dev/null &
    disown
end

# -- Navegar entrando y saliendo de yazi --
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end
