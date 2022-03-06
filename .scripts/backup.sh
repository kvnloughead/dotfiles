#!/bin/bash
# backs up wsl files to onedrive

# for some reason this doesn't work when using ${windows_userdir}

date=$(date '+%m-%d-%Y')
rsync \
  --archive \
  --verbose \
  --delete \
  --exclude 'tutor' \
  --exclude 'practicum/projects' \
  --exclude 'node_modules' \
  --exclude '.npm' \
  --exclude '.nvm' \
  --exclude '.vscode-server' \
  --exclude '.pyenv' \
  --exclude '.cargo' \
  --exclude '.rustup' \
  --exclude '.git' \
  --exclude '.local' \
   /home/kevin/ /mnt/c/Users/kvnlo/OneDrive/testing/$WSL_DISTRO_NAME-$date/