# This script Run this script after cloning dotfiles to new machine.
#!/bin/bash
# Please comment out whatever you don't need

# update package repositories
sudo apt update
sudo apt-get update

# install GitHub cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt install gh

# install pip
sudo apt install python3-pip

# install pyenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl
curl https://pyenv.run | bash

# install watson
pip3 install td-watson

# make `projects` dir and clone some repos
cd ~ && mkdir projects && cd projects
git clone https://github.com/kvnloughead/blog
git clone https://github.com/kvnloughead/command-line-notes
cd command-line-notes && pip install -r requirements.txt

# make `bin` and clone some repos
cd ~ && mkdir bin && cd bin
git clone https://github.com/kvnloughead/command-line-notes
cd command-line-notes && pip install -r requirements.txt

# install n package manager, then install node
sudo mkdir -p /usr/local/n # make cache folder (if missing) and take ownership
sudo chown -R $(whoami) /usr/local/n # make sure the required folders exist 
sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
# take ownership of Node.js install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
bash n lts
npm install -g n
# install latest and current versions of node
n latest
n current

# install useful node packages
npm i -g live-server

# interactive
echo "Authorizing GitHub CLI"
gh auth login

# install typescript
sudo apt install node-typescript

# install utilities
sudo apt-get install zip unzip -y

# If using WSL, map xdg-open command to wslview
if grep -iE '(microsoft|wsl)' /proc/version
then
  sudo ln -s ../../bin/wslview /usr/local/bin/xdg-open
fi

