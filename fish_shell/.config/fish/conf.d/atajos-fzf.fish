# ================================================
#     Alias y funciones que usan fzf
# ================================================

# Abrir un archivo con nvim
alias fvim='nvim $(fzf -m --preview="bat -p {}")'

# Matar procesos
function fkill --description "Matar procesos con fzf"
    set -l sig $argv[1]
    if test -z "$sig"
        set sig 15
    end
    set -l pid (ps -ef | sed 1d | fzf -m --height 40% --border | awk '{print $2}')
    if test -n "$pid"
        echo $pid | xargs kill -$sig
    end
end
# 'fkill' usa 15 por defecto (soft quit), pero
# puedes usar 'fkill 9' para algo más agresivo
# -------------------------------------
