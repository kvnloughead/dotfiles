alias dotgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dg=dotgit

alias dgs='dotgit status'
alias dgl='dotgit log'
alias dglog="dotgit log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias dgd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias dgsw='dotgit switch'
alias dgswc='dotgit switch -c'
alias dgb='dotgit branch'
alias dgm='dotgit merge'

alias dga='dotgit add'
alias dgaf='dotgit add -f'

alias dgc='dotgit commit'
alias dgca='dotgit commit --amend'
alias dgp='dotgit push origin HEAD'

alias dgst='dotgit stash'

function dgrep() {
  # Save the current directory
  local current_dir=$(pwd)

  # Change to home directory and perform grep
  cd && dotgit grep "$@"

  # Change back to the original directory silently
  cd "$current_dir" >/dev/null
}
