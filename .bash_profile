# Source .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

eval "$(/opt/homebrew/bin/brew shellenv)"