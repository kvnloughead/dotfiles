#!/bin/bash
# This script Run this script after cloning dotfiles to new machine.

# update package repositories
sudo apt update
sudo apt-get update

# install GitHub cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt install gh

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
