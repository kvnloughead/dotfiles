# Haven't figured out how to symlink with Windows files. Instead, I have copies # of the config files stored in ~/.dotfiles/program-name/.
#
# 1. To open the real versions for editing, `editor $name-of-config`
# 2. To update the copy of the config file, run the relevant getter function
#
# When initially setting up a new computer, or any time you want to update the configs
# from the copies, run the relevant setter command.

# windows_userdir is declared in ~/.bashrc
terminalconfig="${windows_userdir}/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
vscodesettings="${windows_userdir}/AppData/Roaming/Code/User/settings.json"
vscodekeybindings="${windows_userdir}/AppData/Roaming/Code/User/keybindings.json"

get_terminal_config() {
    echo -n "This will overwrite your copy of the terminal config file. Ok (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then # this grammar (the #[] operator) means that the variable $answer where any Y or y in 1st position will be dropped if they exist.
        cp $terminalconfig ~/dotfiles/terminal/settings.json
    else
        echo Aborting
    fi
}

get_vscode_config() {
    echo -n "This will overwrite your copies of the vscode config files. Ok (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        cp $vscodesettings ~/dotfiles/vscode/settings.json
        cp $vscodekeybindings ~/dotfiles/vscode/keybindings.json
    else
        echo Aborting
    fi
}

get_windows_configs() {
    get_terminal_config
    get_vscode_config
}

set_terminal_config() {
    echo -n "This will overwrite your active Terminal config file. Ok (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        cp ~/dotfiles/terminal/settings.json $terminalconfig
    else
        echo Aborting
    fi
}

set_vscode_config() {
    echo -n "This will overwrite your active VSCode config files. Ok (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        cp ~/dotfiles/vscode/settings.json $vscodesettings
        cp ~/dotfiles/vscode/keybindings.json $vscodekeybindings
    else
        echo Aborting
    fi
}

set_windows_configs() {
    set_terminal_config
    set_vscode_config
}
