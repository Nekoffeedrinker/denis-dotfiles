if status is-interactive

    # ======================== Configurar Fish ========================

    # quitar el mensaje de bienvenida
    set -g fish_greeting

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


    # Commands to run in interactive sessions can go here
end
