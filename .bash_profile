# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Load RVM into a shell session *as a function* [Rust]
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# . "$HOME/.cargo/env"

# Load rbenv [Ruby]
eval "$(rbenv init -)"
