alias g=git

alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gs='git status -sb'
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gsw='git switch'
alias gb='git branch'
alias gm='git merge'

alias ga='git add'
alias gac='git add -A && git commit'
alias gaca='git add -A && git commit --amend'
alias gaf='git add -f'

alias gc='git commit'
alias gca='git commit --amend'

alias gp='git push origin HEAD'

gcp() {
  # usage: `gcp "commit message"`
	git add -A;
	git commit -m "$1";
	git push origin HEAD
}
