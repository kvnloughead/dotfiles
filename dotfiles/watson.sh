# I guess you need to source bash_completion first, I'm not sure why
source /etc/profile.d/bash_completion.sh
source ~/dotfiles/autocomplete/watson # watson autocomplete

alias watsib="watson"
alias wagg="watson aggregate"
alias wconf="watson config"
alias we="watson edit"
alias wf="watson frames"
alias wp="watson projects"
alias wrm="watson remove"
alias wmv="watson rename"
alias wrp="watson report"
alias wrestart="watson restart"
alias ws="watson start"
alias wstat="watson status"
alias wstop="watson stop"
alias wtags="watson tags"
alias wl="watson log"

# replacement for `watson add`. Accepts same args as `watson start`. Creates
# a new task and opens it for editing. More convenient then the alternative.
wa() {
  watson start "$@"
  watson edit
}
