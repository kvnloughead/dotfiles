for f in ~/.aliases/*.sh; do source $f; done

# editors
alias c='cursor'
alias c.='cursor .'
alias c,='cursor .'
alias c..='cursor ..'

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
alias node-wash="rm -rf node_modules && rm package-lock.json && npm i"

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
  # Usage: zp <input_directory> <output_file>
  # Zip all files in <input_directory> except for .git and node_modules, and save the archive to <output_file>.
  if [ "$#" -eq 1 ]; then
    local output_file="${1//\//}".zip
    local input_dir="$1"
    echo $output_file
  else
    local input_dir="$1"
    local output_file="$2"
  fi

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

# misc

alias json_server="json-server --watch db.json --id _id --port 3001"
alias kill_port="npx kill-port"
alias kp="npx kill-port"

# Function to open the current repo and branch in the browser
remote_open() {
    # Get the remote URL
    remote_url=$(git config --get remote.origin.url)
    if [[ -z "$remote_url" ]]; then
        echo "No remote repository found."
        return 1
    fi

    # Get the current branch name
    branch_name=$(git symbolic-ref --short HEAD)
    if [[ -z "$branch_name" ]]; then
        echo "No branch found."
        return 1
    fi

    # Convert the remote URL to the browser URL
    if [[ "$remote_url" == git@github.com:* ]]; then
        # Convert SSH URL to HTTPS URL for GitHub
        browser_url="https://github.com/${remote_url#git@github.com:}"
    elif [[ "$remote_url" == *"github.com"* ]]; then
        # Handle GitHub HTTPS URLs
        browser_url="$remote_url"
    elif [[ "$remote_url" == git@gitlab.com:* ]]; then
        # Convert SSH URL to HTTPS URL for GitLab
        browser_url="https://gitlab.com/${remote_url#git@gitlab.com:}"
    elif [[ "$remote_url" == *"gitlab.com"* ]]; then
        # Handle GitLab HTTPS URLs
        browser_url="$remote_url"
    else
        echo "Unsupported remote repository host."
        return 1
    fi

    # Remove .git suffix if present
    browser_url="${browser_url%.git}"

    # Append the current branch path
    if [[ "$browser_url" == *"github.com"* ]]; then
        browser_url="$browser_url/tree/$branch_name"
    elif [[ "$browser_url" == *"gitlab.com"* ]]; then
        browser_url="$browser_url/-/tree/$branch_name"
    fi

    # Open the URL in the default browser
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open "$browser_url"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        open "$browser_url"
    elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" ]]; then
        start "$browser_url"
    else
        echo "Unsupported OS."
        return 1
    fi
}

function alpha_to_hex() {
    if [ $# -eq 0 ] || [[ "$1" =~ ^(-h|--help|help)$ ]]; then
        echo "Usage: alpha_to_hex <decimal>"
        echo "Convert decimal (0-1) to hex alpha channel (00-ff)"
        echo "Example: alpha_to_hex 0.5 -> #80"
        return
    fi

    printf '#%02x\n' $(printf '%.0f' $(echo "$1 * 255" | bc -l))
}

function hex_to_alpha() {
    if [ $# -eq 0 ] || [[ "$1" =~ ^(-h|--help|help)$ ]]; then
        echo "Usage: hex_to_alpha <hex>"
        echo "Convert hex alpha channel (00-ff) to decimal (0-1)"
        echo "Example: hex_to_alpha 80 -> 0.50"
        return
    fi

    printf "%.2f\n" $(echo "ibase=16; $(echo ${1#\#} | tr '[:lower:]' '[:upper:]') / FF" | bc -l)
}