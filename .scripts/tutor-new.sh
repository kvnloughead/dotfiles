#!/bin/bash

# script to automate tutoring a new student
# creates an directory with their name, clones their repo and opens it in code
# usage `tutor name https://repo.git`

name="$1"
repo="$2"
dirname=$(echo "$2" | sed -e "s/\(.*\/\)\([a-zA-Z0-9\-_]*\)\(\.git\)/\2/gi")
echo $dirname

mkdir ~/dev/tutoring/$name
cd ~/dev/tutoring/$name
git clone $2
echo $dirname
code "$dirname"

