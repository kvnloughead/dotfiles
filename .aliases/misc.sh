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
alias start="explorer.exe"
alias cl="clear"
alias src="source ~/.bashrc"

# set up pbcopy / pbpaste
alias clip="clip.exe"  # usage:  ls | clip  or  clip < file.txt
alias pst="powershell.exe -command 'Get-Clipboard' | head -n -1"

# script aliases
alias crc='crc.sh'    # "Create React Component"

# misc
alias tree="tree -I node_modules"

# micro
alias micro-keybind='micro ~/.config/micro/bindings.json'
alias micro-settings='micro ~/.config/micro/settings.json'

# makes backup of file in the cwd, preserving the extension
# turns foo.baz.ext into foo.baz.bak.ext
bak() {
  FILENAME=$1
  echo "${FILENAME%.*}".bak."${FILENAME##*.}"
}

# Makes prompt "anonymous" by showing only $
anon() { 
  PS1="$ "
}

alias node-wash="rm -rf node_modules && rm package-lock.json"

alias lsa="ls -a"
alias lsl="ls -lhF"
alias lsal="ls -alhF"
