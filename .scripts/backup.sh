#!/bin/bash

# Backs up WSL files to OneDrive
#


date=$(date '+%m-%d-%Y')
mkdir -p /mnt/c/Users/kvnlo/OneDrive/wsl-backups
rsync \
  --archive \
  --verbose \
  --delete \
  --exclude 'tutor' \
  --exclude 'practicum/projects' \
  --exclude 'node_modules' \
  --exclude '.cache' \
  --exclude '.npm' \
  --exclude '.nvm' \
  --exclude '.vscode-server' \
  --exclude '.pyenv' \
  --exclude '.cargo' \
  --exclude '.rustup' \
  --exclude '.git' \
  --exclude '.local' \
   /home/kevin/ /mnt/c/Users/kvnlo/OneDrive/wsl-backups/$WSL_DISTRO_NAME-$date/
