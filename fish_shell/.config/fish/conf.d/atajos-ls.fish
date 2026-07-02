# ================================================
#     Alias de eza para remplazar ls
# ================================================

alias eza='eza --color=always --icons=always --git'
alias ezal='eza -l --no-permissions --no-filesize --no-user --no-time'

abbr ls eza
abbr lsa eza -a
abbr ll eza -lg
abbr lla eza -lga
abbr l ezal
abbr la ezal -a

abbr tree eza -T
