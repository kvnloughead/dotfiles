#!/usr/bin/env bash

# Easily navigate around Practicum SE USA canonicals, test repo, and briefs.
# 
# SETUP 
#   To use, add the line `source path/to/this/file` in your .bashrc file,
#   and then run `source ~/.bashrc`. 
#
# CONFIGURATION
#   Set the three variables below to your desired values.
# 
# USAGE
#   Each function accepts arguments of one of the following forms:
#
#     $cx[_y] represents project canonicals (with optional stages)
#     $tx[_y] represents project level folders in the test repo
#     $bx[_y] represents pdf briefs (for projects 1 and 2)
#
#   For example, $c1_1, $t1_1, and $b1_1 represent the canonical, tests, 
#   and brief for Project 1 Stage 1. 
#
# TODO
# 
#   - Expand to include platform project pages ($px[_y]) for use with se-open 
#   - Include figma URLs for later projects with the briefs
#   - Support starter kits for p0 and p1 

BROWSER="firefox" # executable for your preferred browser
CANONICAL_DIR="/home/$USER/practicum/se-canonicals_en" # local canonical repo
TEST_DIR="/home/$USER/practicum/tests/web-developer" # local test repo

# branch names of canonical projects
# last updated Mar 28, 2023Feb 1
export c0="html/about-me"
export c1_1="html/sprint-1-new_stage-1"
export c1_2="html/sprint-1-new_stage-2"
export c1_4="html/sprint-1-new_stage-4"
export c2_1="html/sprint-2_stage-1"
export c2_2="html/sprint-2_stage-2"
export c2_3="html/sprint-2_stage-3"
export c2_4="html/sprint-2_stage-4"
export c3="html/sprint-3-new"
export c4_1="js/sprint-4-new_stage-1"
export c4_2="js/sprint-4-new_stage-2"
export c4_3="js/sprint-4-new_stage-3"
export c4_4="js/sprint-4-new_stage-4"
export c5="js/sprint-5"
export c6="js/sprint-6"
export c7="js/sprint-7"
export c8="js/sprint-8"
export c9="js/sprint-9"
export c10="react/sprint-10"
export c11="react/sprint-11"
export c12="node/sprint-12"
export c13="node/sprint-13"
export c14="react/sprint-14"
export c15="node/sprint-15"

# WIP - folder names of tests (they are all in `master` branch)
# last updated Feb 1, 2023
export t1_1="project1enSt1_V2"
export t1_2="project1enSt2_V2"
export t1_4="project1enSt4_V2"
export t2_1="project2enSt1_V2"
export t2_2="project2enSt2_V2"
export t2_3="project2enSt3_V2"
export t2_4="project2enSt4_V2"

# PDF brief URLs
# last updated Mar 30, 2023
export b1_1="https://practicum-content.s3.us-west-1.amazonaws.com/web-developer/project-1/new-library/project-1-stage-1-brief.pdf"
export b1_2="https://practicum-content.s3.us-west-1.amazonaws.com/web-developer/project-1/new-library/project-1-stage-2-brief.pdf"
export b1_4="https://practicum-content.s3.us-west-1.amazonaws.com/web-developer/project-1/new-library/project-1-stage-4-brief.pdf"
export b2_2="https://practicum-content.s3.us-west-1.amazonaws.com/web-developer/project-2/project-2-stage-2-brief.pdf"
export b2_3="https://practicum-content.s3.us-west-1.amazonaws.com/web-developer/project-2/project-2-stage-3-brief.pdf"
export b2_4="https://practicum-content.s3.us-west-1.amazonaws.com/web-developer/project-2/project-2-stage-4-brief.pdf"

CANONICAL_URL=https://github.com/practicum-com/se-canonicals_en
TEST_URL=https://github.com/practicum-com/web-developer

print-help() {
  case "$1" in 
    se-cd)

      echo
      echo "COMMAND"
      echo "  se-cd [-t|--test] [BRANCH|DIRECTORY]"
      echo
      echo "DESCRIPTION"
      echo "  Changes directory to a local Practicum SE canonical or test repo."
      echo "  Use with the variables exported above to save some more key presses."
      echo
      echo "OPTIONS"
      echo "  -t|--test"
      echo "    `cd` into test repo instead of canonicals. "
      echo "    Only necessary when running the command with no arguments. "
      echo
      echo "EXAMPLES"
      echo '  se-cd             # cd into canonicals directory.'
      echo '  se-cd -t          # cd into test directory.'
      echo '  se-cd $c1_1       # cd into canonicals and switch branch to p1.1.'
      echo '  se-cd $t1_1       # cd into appropriate directory of test repo.'
      echo
        ;;

    se-open)

      echo
      echo "COMMAND"
      echo "  se-open [BRANCH|DIRECTORY|BRIEF]"
      echo
      echo "DESCRIPTION"
      echo "  Opens various Practicum resources: "
      echo "    - SE canonical remote repo branch"
      echo "    - SE test repo folder"
      echo "    - PDF brief for projects 1 and 2"
      echo "  Use with the variables exported above to save some more key presses."
      echo
      echo "OPTIONS"
      echo "  -t|--test"
      echo "    Open test repo instead of canonical."
      echo "    Only necessary when running the command with no arguments. "
      echo
      echo "EXAMPLES"
      echo '  se-open             # opens canonicals remote in browser.'
      echo '  se-open -t          # opens test remote in browser.'
      echo '  se-open $c1_1       # opens canonical remote to specified branch.'
      echo '  se-open $t1_1    # opens test remote to specified directory.'
      echo '  se-open $b1_1    # opens brief for project 1 stage 1'
      echo  
      ;;

    esac
}

se-cd() {
  local DIR=$CANONICAL_DIR
  while test $# -gt 0; do
    case "$1" in
      -h|--help|help)
        print-help 'se-cd'
        shift
        return
        ;;
      project*)
      echo here
        DIR=$TEST_DIR
        # if [[ "$#" -ne 1 ]]; then 
          DIR=$TEST_DIR/$1
        # fi
        cd $DIR
        return
        ;;
      *)
        cd $DIR && git switch $1
        return
        ;;
      esac
    done
    cd $DIR
}

se-open() {
  local COUNT="$#"
  local URL=https://github.com/practicum-com/se-canonicals_en 
  
  while test $# -gt 0; do
    case "$1" in
      -h|--help|help)
        print-help 'se-open'
        shift
        return
        ;;
      
      https*) # if startswith https, just open in browser
        xdg-open "$1"
        return
        ;;
      -t|--test) # open test repo in browser
        xdg-open "$TEST_URL"
        return
        ;;
      project*) # open specific test repo folder
        URL=$TEST_URL/tree/master/$1
        xdg-open "$URL"
        return
        ;;
      *)
        URL=https://github.com/practicum-com/se-canonicals_en/tree/$1
        xdg-open "$URL"
        return
        ;;
      esac
    done
    # if no arguments, open canonicals in browser
    xdg-open "$URL"
}