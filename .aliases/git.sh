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
alias ga='git add -A'
alias gac='git add -A && git commit'
alias gaca='git add -A && git commit --amend'
alias gaf='git add -f'

alias gc='git commit'
alias gca='git commit --amend'

alias gp='git push origin HEAD'

alias gr='git remote'
alias gst='git stash'
alias gcl="git clone"
alias gclean="git add -A && git reset --hard"
alias gcln="gclean"
alias gacln="ga -A && gclean"

alias gpull='git pull'
alias gfetch='git fetch'

alias githardpull='git reset HEAD --hard && git pull'

gcp() {
  # usage: `gcp "commit message"`
	git add -A;
	git commit -m "$1";
	git push origin HEAD
}

alias gph='git push heroku'
export giturl="git@github.com:kvnloughead"

function fetchswitch() {
  # fetches from origin, switches to fetched branch and sets the upstream
  git fetch origin $1
  git switch $1
  git branch --set-upstream-to=origin/$1
}

function get_remote() {
	# gets remote of cwd if cwd is a git repo
	# loads the remote as an ssh url to the clipboard

  local remote=$(git config --get remote.origin.url)
  if [[ "$remote" =~ ^https:// || git@github.com: ]]; then
    remote=${remote/https:\/\/github.com\//git@github.com:}
    remote=${remote/https:\/\/gitlab.com\//git@gitlab.com:}
    remote=${remote/https:\/\/bitbucket.org\//git@bitbucket.org:}
    remote=${remote/git:\/\/github.com\//git@github.com:}
    remote=${remote/git:\/\/gitlab.com\//git@gitlab.com:}
    remote=${remote/git:\/\/bitbucket.org\//git@bitbucket.org:}
    if [ -t 1 ]; then 
      # if output is a terminal, log a message
      echo "Remote repo copied to clipboard"
      echo "$remote"
      echo "$remote" | xclip -selection clipboard
    else 
      # if in a pipe, just log the remote
      echo "$remote"
    fi
  else
    echo "Not a Git repo or remote URL not recognized"
  fi

}

function swap_git_url {
    local url

    if [[ -n $1 ]]; then
        url="$1"
    else
        read url
    fi

    if [[ $url == "--help" || $url == "-h" || $url == "help" ]]; then
        echo "Usage: git_swap_url repo-url"
        echo "Converts a GitHub HTTPS URL to SSH format or vice versa."
        echo ""
        echo "Options:"
        echo "  --help, -h   display this help and exit"
        return
    fi

    if [[ $url == https://github.com/* ]]; then
        local ssh_url="${url/https:\/\/github.com\//git@github.com:}"
        ssh_url="${ssh_url/.git/}.git"
        echo "$ssh_url"
        echo "$ssh_url" | xclip -selection clipboard
    elif [[ $url == git@github.com:* ]]; then
        local https_url="${url/git@github.com:/https://github.com/}"
        https_url="${https_url/.git/}.git"
        echo "$https_url"
        echo "$https_url" | xclip -selection clipboard
    else
        echo "Invalid GitHub URL."
    fi
}



