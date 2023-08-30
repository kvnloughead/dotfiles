for f in ~/.aliases/*.sh; do source $f; done

# editors
alias c='code'
alias c.='code .'
alias c~='code ~'

alias ctutor='code --user-data-dir=$HOME/.config/Code/User/tutor'
alias ct='ctutor'
alias ct.='ctutor .'

alias v="vim"
alias n="nano"

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

mkcd() {
  mkdir $1
  cd $1
}

alias cl="clear"
alias src="source ~/.bashrc"
alias srctmux="tmux source-file ~/.tmux.conf"
alias tree="tree -I node_modules"

alias lsa="ls -a"
alias lsl="ls -lhF"
alias lsal="ls -alhF"

alias clip="xclip -sel clipboard"

# scripts
alias crc='crc.sh'    # "Create React Component"

# browsers
alias serve="npx live-server --browser=chromium"
alias ff="firefox"
alias chr="google-chrome"

# node
alias nr='npm run'
alias ni='npm install'
alias nrs='npm run start'
alias nrd='npm run dev'
alias nird='ni && nrd'
alias nirs='ni && nrs'
alias nrb='npm run build'
alias node-wash="rm -rf node_modules && rm package-lock.json"

# deno
alias dr='deno run'
alias dra='deno run -A' # allows all permissions, not for use in prod
alias dt='deno task'
alias dtd='deno task dev'

# dev
alias cbdev='node ~/dev/cb/bin/index.js'

# cb
alias cbo='cb o'
alias cbl='cb l'
alias cbg='cb g'
alias cbs='cb s'
alias cbrm='cb rm'

# zip
function zp() {
  # Usage: zp <output_file> <input_directory>
  # Zip all files in <input_directory> except for .git and node_modules, and save the archive to <output_file>.
  local output_file="$1"
  local input_dir="$2"
  zip -r "$output_file" "$input_dir" -x \*.git/* -x \*node_modules/*
}

# min
alias blog="min --cfg $HOME/.config/min/blog.json"
alias til="min --cfg $HOME/.config/min/til.json"

# updates
alias update-vscode="sudo apt update && sudo apt-get upgrade code"

function copy_last_command {
    # Get the most recent command from the history. If run in the terminal, 
    # this returns itself. But run in this script, it returns the previous 
    # command. Might not be a robust solution. 
    command=$(fc -ln -1)
    
    # Remove leading and trailing whitespace
    command=$(echo $command | xargs)
    
    # Pipe the command into xclip to load it to the clipboard
    echo $command | xclip -selection clipboard
    
    echo "Command copied to clipboard: $command"
}

