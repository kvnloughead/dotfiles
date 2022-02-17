alias gp='git pull --prune'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

alias gs='git status -sb'

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gco='git checkout'
alias gsw='git switch'
alias gb='git branch'
alias gm='git merge'

alias ga='git add'
alias gac='git add -A && git commit'
alias gaca='git add -A && git commit --amend'
alias gaf='git add -f'

alias gc='git commit'
alias gca='git commit --amend'

alias gp='git push origin HEAD'

alias gh-new='~/scripts/gh-new.sh'

gcp() {
  # usage: `gcp "commit message"`
	git add -A;
	git commit -m "$1";
	git push origin HEAD
}

git-reset() {
	# An alias with safety features for `git reset`. Checks whether the repo
	# you are about to reset is the dotfiles repo, prompting you before
	# resetting it if it is. This helps prevent unwanted resets that occur with # my dotfiles repo
	if git remote -v | awk -F ' ' 'NR==1{print $2}' | grep "dotfiles" 1> /dev/null
	then
		read -p "Reset your dotfiles repo? " -n 1 -r
		echo
		if [[ ! $REPLY =~ ^[Yy]$ ]]
		then
			echo "Cancelling reset"
		else
			git reset $@
		fi
	fi
}
