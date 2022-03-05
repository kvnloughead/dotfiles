alias dotgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dg=dotgit

alias dgs='dotgit status -sb'
alias dgl="dotgit log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias dgd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias dgco='dotgit checkout'
alias dgsw='dotgit switch'
alias dgb='dotgit branch'
alias dgm='dotgit merge'

alias dga='dotgit add'
alias dgaf='dotgit add -f'

alias dgc='dotgit commit'
alias dgca='dotgit commit --amend'
alias dgp='dotgit push origin HEAD'