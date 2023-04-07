#!/bin/bash

# Run this script after cloning dotfiles and unpacking the files. These commands
# should work on most Ubuntu/Debian distributions, but no guarantees. Please 
# comment out whatever you don't need.
#
# Note that A few WSL specific commands are found at the bottom of the script. 

function initial-dotfiles-install() {

  # only install gui apps if not on WSL
  if ! grep -iE '(microsoft|wsl)' /proc/version
  then
    # 1password
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    sudo apt update
    sudo apt install 1password

    # vscode
    sudo apt-get install wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
    sudo apt install apt-transport-https
    sudo apt update
    sudo apt install code    

    # obs
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:obsproject/obs-studio
    sudo apt update
    sudo apt install obs-studio
    
  fi
  
  # git
  sudo apt install git
  git config --global user.name = "Kevin Loughead"
  git config --global user.email = "kvnloughead@gmail.com"
  git config --global init.defaultBranch main

  # github CLI
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt install gh

  # install python3-pip if not present
  which pip3 || sudo apt install python3-pip
  # install pyenv. Necessary loading code already added to ~/.bashrc
  sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl
  curl https://pyenv.run | bash

  # node related
  # install n package manager, then install node
  mkdir ~/utils
  curl -L https://git.io/n-install | N_PREFIX=~/util/n bash -s -- -y
  # install latest and current versions of node
  n latest
  n current

  # install useful node packages
  npm i -g live-server
  sudo apt install node-typescript

  # deno
  curl -fsSL https://deno.land/x/install/install.sh | sh

  # etc
  sudo apt install xclip
  sudo apt install jq

  # below here requires GitHub SSH authentication
  # probably should make a separate, private script?

  # interactive
  echo "Authorizing GitHub CLI"
  gh auth login

  # make `dev` dir and clone some repos
  cd ~ && mkdir dev && cd dev
  git clone git@github.com:kvnloughead/blog.git
  git clone git@github.com:kvnloughead/command-line-notes.git
  git clone git@github.com:kvnloughead/clipboard-manager.git
  cd command-line-notes && pip install -r requirements.txt
  cd ~

  # make `bin` dir and set up some utilities
  cd ~ && mkdir bin && cd bin

  # CLN
  git clone git@github.com:kvnloughead/command-line-notes.git
  cd command-line-notes && pip install -r requirements.txt
  cd ~ && mkdir -p .cln/notes && cd .cln/notes
  git init
  git remote add origin git@github.com:kvnloughead/notes.git
  git pull origin main

  # If using WSL, map xdg-open command to wslview
  if grep -iE '(microsoft|wsl)' /proc/version
  then
    # map xdg-open command to wslview
    sudo ln -s ../../bin/wslview /usr/local/bin/xdg-open
    sudo apt-get install zip unzip -y
  fi

}
