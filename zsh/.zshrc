# ========================= PLUGINS =========================

ulimit -n 4096   # Aumentar límite de file descriptors

# Habilitar el prompt instantaneo de Powerlevel10k. Debe estar cerca del inicio de ~/.zshrc. 
# El código de inicialización que puede requerir entrada por consola (solicitudes de contraseña, 
# confirmaciones [y/n], etc.) debe ir antes de este bloque; todo lo demás puede ir después.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh_plugins/powerlevel10k/powerlevel10k.zsh-theme
# Para personalizar el promt, ejecuta `p10k configure` o edita ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

setopt interactivecomments
source ~/.zsh_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Acá se agregan más plugins.
# Dejar powerlevel10k al incio y zsh-syntax-highlighting al final

source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


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
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# Evitar que un comando se guarde cuando tiene un espacio adelante
setopt hist_ignore_space
# usar C-n y C-p para navegar el historial
bindkey '^p' history-search-backward
bindkey '^n' history-serach-forward

# === Toggles de funciones ===
setopt nomatch          # error si un patrón no encuentra archivos
setopt notify           # avisar inmediatamente cuando un job en background termina
unsetopt autocd         # requerir escribir cd para navegar directorios
unsetopt beep           # silenciar beep en errores
unsetopt extendedglob   # desactivar patrones de búsqueda avanzados
setopt globdots         # buscar ocultos
# Atajos tipo emacs
bindkey -e

# === Sitema de autocompletado ===
zstyle :compinstall filename '/home/denis/.zshrc'
autoload -Uz compinit
compinit


# === === === Programas === === ===

# Arreglar el clear de kitty
clear() {
  printf '\033[2J\033[3J\033[H'
}


# ========================= ALIAS =========================

# Recostruir nix
alias rebuild="sudo nixos-rebuild switch --flake ~/denisNixOS/#thinkpadx13"

