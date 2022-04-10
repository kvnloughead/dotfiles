#!/bin/bash

# Backs up WSL files to OneDrive
mkdir -p /mnt/c/Users/kvnlo/OneDrive/wsl-backups
date=$(date '+%m-%d-%Y-h%Hm%M')
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
  --exclude 'practicum/tasks' \
  --exclude 'fonts' \
   /home/kevin/ /mnt/c/Users/kvnlo/OneDrive/wsl-backups/$WSL_DISTRO_NAME-$date/
