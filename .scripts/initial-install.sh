#!/bin/bash
# This script Run this script after cloning dotfiles to new machine.
# Please comment out whatever you don't need

# update package repositories
sudo apt update
sudo apt-get update

# install GitHub cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt install gh

# install and set up mongodb
sudo apt-get install mongodb -y
sudo mkdir -p /data/db
sudo chmod -R go+w /data/db

# install micro
curl https://getmic.ro | bash
sudo mv micro /usr/bin

# install pip
sudo apt install python3-pip

# install pyenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl
curl https://pyenv.run | bash

# install watson
pip3 install td-watson

# make `dev` dir and clone some repos
cd ~ && mkdir dev && cd dev
git clone https://github.com/kvnloughead/blog
git clone https://github.com/kvnloughead/command-line-notes

# make `bin` and clone some repos
cd ~ && mkdir bin && cd bin
git clone https://github.com/kvnloughead/command-line-notes

# update npm
sudo npm i -g npm

# interactive
echo "Authorizing GitHub CLI"
gh auth login

# C utilities
sudo apt install clang
sudo apt install gdb  # for debugger

# Install heroku CLI
curl https://cli-assets.heroku.com/install.sh | sh

# Ruby on Rails installation
# [source](https://gorails.com/setup/ubuntu/18.04)
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
yarn