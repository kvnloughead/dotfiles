#!/bin/bash
# Script to create a new repo and push to it. Requirements:
#  - must be on `main` branch
#  - must have at least on commit to push 

name=$1

if [[ $# -eq 0 ]] ; then
    echo 'Repo name is a required argument.'
    exit 0
fi

# gh create-repo $name
gh repo create $name --public

git remote add origin https://github.com/kvnloughead/$name.git
git push -u origin main