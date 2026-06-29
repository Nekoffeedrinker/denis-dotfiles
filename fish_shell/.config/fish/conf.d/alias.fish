# === === Listar directorios === ===

alias ls='ls --color'

alias eza='eza --color=always --icons=always --git --across'
abbr l eza
abbr la eza -a
abbr ll eza -lg
abbr lla eza -lga

alias li='eza -l --no-permissions --no-filesize --no-user --no-time'
abbr lia li -a

abbr t eza -T
abbr ta eza -Ta


# === === Leer archivos de texto plano === ===

abbr batno bat -P   # bat sin pager
abbr batpl bat -pp  # bat sin pager ni decoraciones


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
abbr gl git log
abbr glo git log --oneline

# -- Abrir Lazygit --
abbr lg lazygit



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
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end
