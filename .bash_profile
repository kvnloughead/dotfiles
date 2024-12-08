# Setup git autocompletion on macOS
# Note that you may need to run `brew reinstall git` to get this to work
eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# Source .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Load .profile if it exists
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
. "/Users/kevinloughead/.deno/env"