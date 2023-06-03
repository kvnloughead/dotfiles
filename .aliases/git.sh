alias g=git

alias gl="git log"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gs='git status'
alias gd='git diff'
alias gdiff='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gsw='git switch'
alias gswc='git switch -c'
alias gb='git branch'
alias gm='git merge'

alias ga='git add'
alias gac='git add -A && git commit'
alias gaca='git add -A && git commit --amend'
alias gaf='git add -f'

alias gc='git commit'
alias gca='git commit --amend'

alias gp='git push origin HEAD'

alias gr='git remote'
alias gst='git stash'
alias gcl="git clone"

alias githardpull='git reset HEAD --hard && git pull'

gcp() {
  # usage: `gcp "commit message"`
	git add -A;
	git commit -m "$1";
	git push origin HEAD
}

alias gph='git push heroku'
export giturl="git@github.com:kvnloughead"

function getremote() {
	# gets remote of cwd if cwd is a git repo
	# loads the remote as an ssh url to the clipboard
  local remote=$(git config --get remote.origin.url)
	echo $remote
  if [[ "$remote" =~ ^https:// || git@github.com: ]]; then
    remote=${remote/https:\/\/github.com\//git@github.com:}
    remote=${remote/https:\/\/gitlab.com\//git@gitlab.com:}
    remote=${remote/https:\/\/bitbucket.org\//git@bitbucket.org:}
    remote=${remote/git:\/\/github.com\//git@github.com:}
    remote=${remote/git:\/\/gitlab.com\//git@gitlab.com:}
    remote=${remote/git:\/\/bitbucket.org\//git@bitbucket.org:}
    echo "$remote" | xclip -selection clipboard
    echo "Remote repo copied to clipboard in SSH format"
  else
    echo "Not a Git repo or remote URL not recognized"
  fi
}

