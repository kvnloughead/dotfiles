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
alias serve="npx live-server --browser=google-chrome"

# node
alias nr='npm run'
alias node-wash="rm -rf node_modules && rm package-lock.json"
