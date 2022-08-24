#!/bin/bash

name=$1

if [[ $# -eq 0 ]] ; then
    echo 'Repo name is a required argument.'
    exit 0
fi

# gh create-repo $name
gh repo create $name --public

git remote add origin https://github.com/kvnloughead/$name.git
git push -u origin main
