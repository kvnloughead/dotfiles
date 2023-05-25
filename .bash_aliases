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
alias serve="npx live-server --browser=chromium"

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
alias dra='deno run -A' # allows all permissions, no for use in prod
alias dt='deno task'
alias dtd='deno task dev'

# vscode
alias c='code'
alias c.='code .'
alias ctutor='code --user-data-dir=$HOME/.config/Code/User/tutor'
alias ct='ctutor'
alias ct.='ctutor .'

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
