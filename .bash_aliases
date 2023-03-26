for f in ~/.aliases/*.sh; do source $f; done

alias c="code"

# navigation
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

mkcd() {
  mkdir $1
  cd $1
}

# convenience
alias cl="clear"
alias src="source ~/.bashrc"
alias tree="tree -I node_modules"

alias lsa="ls -a"
alias lsl="ls -lhF"
alias lsal="ls -alhF"

# scripts
alias crc='crc.sh'    # "Create React Component"

# live-server
alias serve="npx live-server --browser=${CHROME}"


# node
alias nr='npm run'
alias node-wash="rm -rf node_modules && rm package-lock.json"

# deno
alias dr='deno run -A' # allows all permissions, no for use in prod

# vscode
alias c='code'
alias c.='code .'
alias ctutor='code --user-data-dir=$HOME/.config/Code/User/tutor'
alias ct='ctutor'
alias ct.='ctutor .'