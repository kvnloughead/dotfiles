#!/bin/bash
# Fragile script to create a new repo and push to it. Requirements:
#  - must not have a remote set already
#  - must be on `main` branch
#  - must have at least one commit to push
#  - requires jq for processing gh api data
#  - must authenticate with `gh auth login` before using

function gh-new() {
    local COUNT="$#"
    local COMMAND="$1"
    local REPO_NAME="$1"
    shift 1
    local OPTIONS="$@"
    local USERNAME=$(gh api user | jq -r '.login')

    if [[ $COUNT -eq 0 || "$COMMAND" == "help" || "$COMMAND" == "--help" || "$COMMAND" == "-h" ]]; then
        echo
        echo "COMMAND"
        echo "  gh-new <repo-name> [options]"
        echo
        echo "DESCRIPTION"
        echo "  Creates a repo on GitHub, and syncs it to the current local Git repo."
        echo "  Defaults to public, but this can be changed with the --private option."
        echo "  Accepts all flags that gh-repo-create accepts."
        echo 
        echo "EXAMPLES"
        echo "  gh-new my-project" 
        echo "  gh-new my-project --private"
        echo "  gh-new my-project -l MIT"
        echo
        echo "OPTIONS"
        echo "  --public"
        echo "      Makes the new repo public. This is the default behavior."
        echo
        echo "  --private"
        echo "      Makes the new repo private."
        echo
        return
    fi
    local REPO_ID=$(curl --silent https://api.github.com/repos/$USERNAME/$REPO_NAME | jq -r '.id')
    if [[ "$REPO_ID" != "null" ]]
    then
        echo "The repo "$USERNAME"/$REPO_NAME already exists"
        return
    fi
    # create new repo
    if echo $OPTIONS | grep -o "private\|public"
    then
        gh repo create $REPO_NAME $OPTIONS    
    else
        gh repo create $REPO_NAME --public $OPTIONS
    fi

    git remote add origin git@github.com:$USERNAME/$REPO_NAME.git
    git push -u origin main
}

