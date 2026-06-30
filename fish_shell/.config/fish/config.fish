if status is-interactive

    # quitar el mensaje de bienvenida
    set -g fish_greeting

    # Promnt de Starship (con transcient mode)
    starship init fish | source
    enable_transience
    function starship_transient_prompt_func
        starship module character
    end

    # Commands to run in interactive sessions can go here
end
