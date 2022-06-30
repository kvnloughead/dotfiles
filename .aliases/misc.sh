# will check for permission before removing something
# run `rm -f` to omit request for permission
alias rm="rm -i"

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

# makes backup of file in the cwd, preserving the extension
# turns foo.baz.ext into foo.baz.bak.ext
bak() {
  FILENAME=$1
  echo "${FILENAME%.*}".bak."${FILENAME##*.}"
}