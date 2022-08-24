#!/bin/bash
# Bash script that uses VScode to facilitate rapid creation and opening of BEM css files in vscode

# Usage: from root directory of project, enter # bem [block] [element] [modifier] [value], leaving empty what isn't needed.

# TODO 
#   1. make it work for modified blocks
#   2. write all necessary import statements too
#


block="$1"
elem="$2"
mod="$3"
val="$4"

if [ "$#" -eq 1 ]; then
  code "blocks/$block/$block.css"
  exit
fi

if [ "$#" -eq 2 ]; then
  code "blocks/$block/__$elem/$block""__""$elem.css"
  exit
fi

if [ "$#" -eq 3 ]; then
  code "blocks/$block/__$elem/_$mod/$block""__""$elem""_""$mod.css"
  exit
fi

if [ "$#" -eq 4 ]; then
  code "blocks/$block/__$elem/_$mod/$block""__""$elem""_""$mod""_""$val.css"
  exit
fi
