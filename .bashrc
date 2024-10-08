# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# grabs git branch for placement in prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\[\033[0;33m\]$(parse_git_branch)\[\033[00m\] \n$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w$(parse_git_branch) \n$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_profiles ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Source user defined scripts files
source ~/.scripts/index.sh
if [ -f ~/tripleten/scripts/index.sh ]; then
    . ~/tripleten/scripts/index.sh
fi

# If installed, load pyenv
if [[ $(command -v pyenv) ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# If installed, source cargo enviornment
if [[ $(command -v cargo) ]]; then
  . "$HOME/.cargo/env"
fi

# Load exercism auto completion
if [ -f ~/.config/exercism/exercism_completion.bash ]; then
    source ~/.config/exercism/exercism_completion.bash
fi

# needed on ubuntu laptop for some tricky reason
export DISPLAY=:0

# path
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/crc:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="~/data/db:$PATH"
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/go/bin"

export EDITOR='vim'
export gh='https://github.com/kvnloughead/'
export lh='http://localhost'

bind 'set bell-style none'

# If using WSL, load WSL specific settings
if grep -iE '(microsoft|wsl)' /proc/version 1> /dev/null
then
    windows_userdir=`cmd.exe /c "echo %USERPROFILE%" 2> /dev/null | tr -d '\r'`
    windows_userdir=`wslpath "${windows_userdir}"`
    CHROME="/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe"
    alias serve="npx live-server --browser=${CHROME}"

    for f in ~/.config/wsl/*.sh; do source $f; done
else
    CHROME="google-chrome"
fi

# tt time-tracker
export SHEET_FILE='/home/kevin/Dropbox/tt/time-entries.json'

export N_PREFIX="$HOME/util/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

alias vim="vim -S ~/.vimrc"  # vim wasn't reading ~/.vimrc

###-begin-cb-completions-###
#
# yargs command completion script
#
# Installation: cb completion >> ~/.bashrc
#    or cb completion >> ~/.bash_profile on OSX.
#
_cb_yargs_completions()
{
    local cur_word args type_list

    cur_word="${COMP_WORDS[COMP_CWORD]}"
    args=("${COMP_WORDS[@]}")

    # ask yargs to generate completions.
    type_list=$(cb --get-yargs-completions "${args[@]}")

    COMPREPLY=( $(compgen -W "${type_list}" -- ${cur_word}) )

    # if no match was found, fall back to filename completion
    if [ ${#COMPREPLY[@]} -eq 0 ]; then
      COMPREPLY=()
    fi

    return 0
}
complete -o bashdefault -o default -F _cb_yargs_completions cb
###-end-cb-completions-###

# deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# remaps ralt to rtrl on hp laptop
# for some reason, it often stops working, requiring you to source the file again 
if [ $(hostname) == "hp-laptop" ]; then
    setxkbmap -option 'ctrl:ralt_rctrl'
fi


# start tmux by default (with appropriate theme)
if command -v tmux>/dev/null; then
    # prevents starting in tmux if terminal is in a vscode instance
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && [ "${TERM_PROGRAM}" != "vscode" ] && tmux new-session -A -s main

    # check if we have been switched to light, else go dark
    [[ ! $(tmux show-environment | grep THEME) =~ 'THEME=light' ]] && 
    tmux set-environment THEME dark
fi

PS1_DARK='${debian_chroot:+($debian_chroot)}\[\033[01;95m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\[\033[0;33m\]$(parse_git_branch)\[\033[00m\] $ '
PS1_LIGHT='${debian_chroot:+($debian_chroot)}\[\033[01;95m\]\u@\h\[\033[00m\] \[\033[1;94m\]\w\[\033[00m\]\[\033[0;33m\]$(parse_git_branch)\[\033[00m\] $ '

PS1_TRIPLETEN='${debian_chroot:+($debian_chroot)}\[\033[01;95m\]kevin@tripleten\[\033[00m\] \[\033[1;94m\]\w\[\033[00m\]\[\033[0;33m\]$(parse_git_branch)\[\033[00m\] $ '

PS1_LOCAL='${debian_chroot:+($debian_chroot)}\[\033[01;95m\]kevin@local\[\033[00m\] \[\033[1;94m\]\w\[\033[00m\]\[\033[0;33m\]$(parse_git_branch)\[\033[00m\]$ '

set_prompt_theme() {
  if [ "$(tmux show-environment | grep THEME | cut -d'=' -f2)" = 'dark' ]; then
    PS1="$PS1_DARK"
  else
    PS1="$PS1_LIGHT"
  fi
}
set_prompt_theme

alias ol="tmux source-file ~/.tmux_light.conf; tmux set-environment THEME 'light'; set_prompt_theme; gsettings set org.cinnamon.theme name 'Mint-Y'; reconfiger -f $HOME/.config/Code/User/settings.json set workbench.colorTheme 'Default Light Modern'"
alias od="tmux source-file ~/.tmux_dark.conf; tmux set-environment THEME 'dark'; set_prompt_theme; gsettings set org.cinnamon.theme name 'Mint-Y-Dark'; reconfiger -f $HOME/.config/Code/User/settings.json set workbench.colorTheme 'GitHub Dark Dimmed'"

source <(min completions bash)

export DISTRO=focal  # actual is vera, but it is based off of ubuntu focal
