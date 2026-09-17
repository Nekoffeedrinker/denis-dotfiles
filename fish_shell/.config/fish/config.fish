if status is-interactive
    # Commands to run in interactive sessions can go here

    # ======================== Configurar Fish ========================

    # quitar el mensaje de bienvenida
    set -g fish_greeting

    # definir donde esta la config de starship
    set -x STARSHIP_CONFIG ~/.config/starship-fish.toml

    # Promnt de Starship (con transcient mode)
    starship init fish | source
    enable_transience
    function starship_transient_prompt_func
        starship module character
    end

    # usar Zoxide
    zoxide init --cmd cd fish | source

    # usar fzf y sus atajos de teclado
    fzf --fish | source

    # ======================== Configurar más cosas ========================

    set -x EDITOR nvim
    set -x VISUAL nvim
    set -gx LS_COLORS (cat ~/.config/fish/anexos/ls_colors_ayu)
    fish_add_path ~/.config/emacs/bin
    fish_add_path ~/.local/bin
    fish_add_path /var/lib/flatpak/exports/bin

    # Arreglar el clear en Kitty
    function clear
        printf '\033[2J\033[3J\033[H'
    end

    # Hacer que no se guarde historial de jrnl
    abbr jrnl " jrnl"

    # Larper mode
    abbr fetch hyfetch
end
