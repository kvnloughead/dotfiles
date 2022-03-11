#!/bin/bash

# Script to facilitate tutoring students.
#
# Usage
#        `$ tutor.sh name repo`
#
# Creates directory ~/tutor/$name, clones repo into it and opens in VSCode.

name="$1"
repo="$2"
dirname=$(echo "$repo" | sed -e "s/\(.*\/\)\([a-zA-Z0-9\-_]*\)\(\.git\)/\2/gi")

mkdir -p ~/tutor/$name
cd ~/tutor/$name
git clone $repo
code ~/tutor/$name/"$dirname"

