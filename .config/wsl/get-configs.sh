# WSL only 
#
# I Haven't figured out how to symlink successfully between Windows and WSL.
# So to keep my VSCode and Terminal config files in version control, I am
# keeping copies of each config file in ~/.config/, and wrote some code to help 
# manage the copies. Don't judge.
#
# Basic Usage
#
# 1. To open the real versions for editing, `code $name-of-config`
# 2. To update the copy of the config file, run the relevant getter function
#
# When initially setting up a new computer, or any time you want to update the
# actual configs from the copies, run the relevant setter command. So,
#
# get_terminal_config -- overwrites actual with copy
# set_terminal_config -- overwrites copy with actual

# $windows_userdir is declared in ~/.bashrc
terminalconfig="${windows_userdir}/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
vscodesettings="${windows_userdir}/AppData/Roaming/Code/User/settings.json"
vscodekeybindings="${windows_userdir}/AppData/Roaming/Code/User/keybindings.json"

# Overwrites copy of terminal config file with actual config file
get_terminal_config() {
    echo -n "This will overwrite your copy of the terminal config file. Ok (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;
    then
        cp $terminalconfig ~/.config/wsl/terminal/settings.json
    else
        echo Aborting
    fi
}

# Overwrites copy of vscode config files with actual config files
# Effects both settings.json and keybindings.json
get_vscode_config() {
    echo -n "This will overwrite your copies of the vscode config files. Ok (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        cp $vscodesettings ~/.config/Code/Users/settings.json
        cp $vscodekeybindings ~/.config/Code/Users/keybindings.json
    else
        echo Aborting
    fi
}

# Overwrites copies of terminal and vscode config files with actual config files
get_windows_configs() {
    get_terminal_config
    get_vscode_config
}

# Overwrites actual terminal config with your copies
set_terminal_config() {
    echo -n "This will overwrite your active Terminal config file. Ok (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        cp ~/.config/terminal/wsl/settings.json $terminalconfig
    else
        echo Aborting
    fi
}

# Overwrites actual vscode configs with your copies
# Effects both settings.json and keybindings.json
set_vscode_config() {
    echo -n "This will overwrite your active VSCode config files. Ok (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        cp ~/.config/Code/Users/settings.json $vscodesettings
        cp ~/.config/Code/Users/keybindings.json $vscodekeybindings
    else
        echo Aborting
    fi
}

# Overwrites actual terminal and vscode configs with your copies
set_windows_configs() {
    set_terminal_config
    set_vscode_config
}
