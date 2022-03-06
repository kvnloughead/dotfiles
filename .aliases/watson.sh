# I guess you need to source bash_completion first, I'm not sure why
source /etc/profile.d/bash_completion.sh
source ~/.config/autocomplete/watson # watson autocomplete

alias w=watson
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

# Creates a zero length, already stopped task and opens for editing
# Much easier than trying to pass --to and --from from command line 
wa() {
  watson start "$@"
  waston stop
  watson edit
}