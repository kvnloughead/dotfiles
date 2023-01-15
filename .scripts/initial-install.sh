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

# Ruby on Rails installation
# [source](https://gorails.com/setup/ubuntu/18.04)
# sudo apt install curl
# curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# sudo apt-get update
# sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

# cd
# git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
# echo 'eval "$(rbenv init -)"' >> ~/.bashrc
# exec $SHELL

# git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
# echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
# exec $SHELL

# After this, you still need to run install a ruby version and gems. Example:
# rbenv install 3.1.2
# rbenv global 3.1.2
# gem install rails
# gem install bundler
# rbenv rehash # must run this command after installing bundler

# end Ruby on Rails installation

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
yarn

# install typescript
sudo apt install node-typescript

# install utilities
sudo apt-get install zip unzip -y

# map xdg-open command to wslview
sudo ln -s ../../bin/wslview /usr/local/bin/xdg-open
