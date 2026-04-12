# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch notify
unsetopt autocd beep extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/denis/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# ==================== denis configs ====================

# Arreglar el clear de kitty
clear() {
  printf '\033[2J\033[3J\033[H'
}

# Alias para recostruir nix
alias rebuild='sudo nixos-rebuild switch --flake ~/denisNixOS/#thinkpadx13'
