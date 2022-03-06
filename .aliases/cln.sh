
alias cln='python3 ~/bin/command-line-notes/main.py'
alias clne='python3 ~/bin/command-line-notes/main.py edit'
alias clnd='python3 ~/bin/command-line-notes/main.py delete'
alias clns='python3 ~/bin/command-line-notes/main.py show'
alias clno='python3 ~/bin/command-line-notes/main.py opendir'
alias clnp='python3 ~/bin/command-line-notes/main.py push'
alias clnc='python3 ~/bin/command-line-notes/main.py commit'
alias clng='python3 ~/bin/command-line-notes/main.py grep'
alias clnf='python3 ~/bin/command-line-notes/main.py find'
alias clnr='python3 ~/bin/command-line-notes/main.py rename'

clndeploy() {
    # deploys command-line-notes
    # must start in `dev` branch of ~/dev/command-line-notes
    git checkout main
    git merge dev
    git push origin main
    cd ~/bin/command-line-notes
    git checkout main
    git pull
    cd ~/dev/command-line-notes
