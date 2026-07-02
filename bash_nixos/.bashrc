# Cargar alias desde archivo externo
if [ -f ~/.denisDotfiles/EXTRAS/alias_comandos ]; then
    source ~/.denisDotfiles/EXTRAS/alias_comandos
fi

# Usar prompt de starship
export STARSHIP_CONFIG=~/.config/starship-bash.toml
eval "$(starship init bash)"
