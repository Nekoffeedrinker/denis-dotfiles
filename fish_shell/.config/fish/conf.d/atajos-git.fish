# ================================================
#     Alias para comandos de git
# ================================================

abbr gs git status

abbr gd git diff
abbr gds git diff --staged
abbr gdd git -c delta.features=side-by-side diff
abbr gdds git -c delta.features=side-by-side diff --staged

abbr ga git add
abbr gap git add -p

abbr gc git commit
abbr gca git commit --amend
abbr gce git commit --amend --no-edit

abbr gl git log --oneline --graph
abbr gla git log --oneline --graph --all
abbr gle git log --graph
abbr glea git log --graph --all
abbr gll git log -1

abbr gsh git show
abbr gck git checkout # commits
abbr gsw git switch # branch/ramas
