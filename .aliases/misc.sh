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
alias lsa="ls -a"
alias lsal="ls -al"
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
