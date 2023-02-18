#!/usr/bin/env bash
# This script should be sourced. 

function tutor() {
  local COUNT="$#"
  if [[ $COUNT -eq 0 || "$1" == "help" || "$1" == "--help" || "$1" == "-h" ]]; then
    echo
    echo "COMMAND"
    echo "  tutor <name> [urlOrPath]"
    echo
    echo "DESCRIPTION"
    echo "  Facilitates easy access and storage of students files for tutoring."
    echo "  Assumes student's repos are stored in directories of the form"
    echo "  ~/tutor/name. Supports github repos and downloaded zip archives."
    echo
    echo "EXAMPLES"
    echo "  tutor person"
    echo "    # creates directory ~/tutor/person and cd's into it"
    echo "  tutor person repoUr"
    echo "    # creates directory, then clones repo into it"
    echo "  tutor person foobar.zip"
    echo "    # creates directory, copies ~/Downloads/foobar.zip to it, and unzips it"
    echo
    return
  fi

  local name="$1"
  local urlOrPath="$2"

  DIR=~/tutor/$name
  if test ! -d "$DIR"; then
      mkdir -p $DIR
  fi
  cd $DIR

  if [[ $urlOrPath == https* || $urlOrPath == git@github.com* ]]; then
    git clone $urlOrPath
  elif [ ! -z $urlOrPath ]; then
    mv ~/Downloads/$urlOrPath.zip .
    unzip $urlOrPath.zip
    rm $urlOrPath.zip
    cd $urlOrPath
  fi

}