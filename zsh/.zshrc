# Habilitar el prompt instantaneo de Powerlevel10k. Debe estar cerca del inicio de ~/.zshrc. 
# El código de inicialización que puede requerir entrada por consola (solicitudes de contraseña, 
# confirmaciones [y/n], etc.) debe ir antes de este bloque; todo lo demás puede ir después.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ulimit -n 4096   # Aumentar límite de file descriptors

# ========================= ZINIT =========================

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# ========== PLUGINS ==========

# Añadir Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Añadir plugins zsh
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab        # REQUIERE EL PAQUETE fzf

# Cargar completados
autoload -Uz compinit && compinit

# Para personalizar el promt, ejecuta `p10k configure` o edita ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ========================= CONFIGS =========================

# Dar color al menú de autocompletado
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# === historial de comandos ===
# Dónde esta guardado el historial
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
# Prevenir comandos duplicados
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# === Toggles de funciones ===
setopt nomatch          # error si un patrón no encuentra archivos
setopt notify           # avisar inmediatamente cuando un job en background termina
unsetopt autocd         # requerir escribir cd para navegar directorios
unsetopt beep           # silenciar beep en errores
unsetopt extendedglob   # desactivar patrones de búsqueda avanzados
setopt globdots         # buscar ocultos

# === Estilo de completado ===
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# parte de fzf-tab
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# === === === Programas === === ===

# Título de la ventana en la terminal
precmd() { print -Pn "\e]0;%~\a" }
preexec() { print -Pn "\e]0;%~ | $1\a" }

# Arreglar el clear de kitty
clear() {
  printf '\033[2J\033[3J\033[H'
}

# ========================= ATAJOS =========================

# Atajos tipo emacs
bindkey -e

# usar C-n y C-p para navegar el historial
bindkey '^p' history-search-backward
bindkey '^n' history-serach-forward

# Recuperar el home, end y supr
bindkey '\e[H'  beginning-of-line
bindkey '\e[F'  end-of-line
bindkey '\e[3~' delete-char

bindkey ' ' magic-space

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# ========================= ALIAS =========================

# Cargar alias desde archivo externo
if [ -f ~/.denisDotfiles/EXTRAS/alias_comandos ]; then
    source ~/.denisDotfiles/EXTRAS/alias_comandos
fi

# == Recostruir nix ==
# alias rebuild="sudo nixos-rebuild switch --flake ~/denisNixOS/#thinkpadx13"

# === === Integraciones de shell === ===
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# ========================= VARIABLES DE ENTORNO =========================
export EDITOR=nvim
export VISUAL=nvim

# ========================= SOURCES =========================

# Usar fzf con git
source ~/.denisDotfiles/SCRIPTS/fzf-git.sh

# ========================= PATH =========================
export PATH="$HOME/.config/emacs/bin:$PATH"
