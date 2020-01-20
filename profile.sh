#!/bin/bash

CONFIG_FOLDER="$HOME/config"

declare -a configFiles=('.vimrc' '.tmux.conf' '.gitconfig' '.Xdefaults' '.zshrc')

for configFile in ${configFiles[@]}; do
    if [ ! -e ~/$configFile ]; then
        ln -s $CONFIG_FOLDER/$configFile ~
    fi
done

# Config files in other folders
declare -a configFolders=('i3' 'sway' 'polybar')

for configFolder in ${configFolders[@]}; do
    if [ -d ~/.config/$configFolder ]; then
        rm ~/.config/$configFolder/config
        ln -s $CONFIG_FOLDER/.$configFolder ~/.config/$configFolder/config
    fi
done

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Set default terminal to urxvt
export TERMINAL="urxvt"

# added by Anaconda3 installer
export PATH="/home/rizhiy/anaconda3/bin:$PATH"
export PATH="/home/rizhiy/miniconda3/bin:$PATH"

# Prepend our executables to PATH
export PATH=$CONFIG_FOLDER/bin:$PATH

# Add russian keyboard
setxkbmap -layout gb,ru
setxkbmap -option 'grp:win_space_toggle'

# Install Vim plugins
vim +PluginInstall +qall &>/dev/null & disown;
# Compile YCM
python ~/.vim/bundle/youcompleteme/install.py --clangd-completer &>/dev/null & disown;

# Check gitconfig
grep_end="\[include\]\n\tpath = config/.gitconfig\n"
insert_end="[include]\n\tpath = config/.gitconfig\n"
if [[ -z "$( grep -Pzo "$grep_end" "$HOME"/.gitconfig | tr '\0' '\n' )" ]]; then
    echo "$insert_end" >> "$HOME"/.gitconfig
fi

# Install fonts
cd "$CONFIG_FOLDER/fonts"
./install.sh
cd -
cd "$CONFIG_FOLDER/awesome-terminal-fonts"
./install.sh
cd -
sed 's/<family>PragmataPro<\/family>/<family>FontAwesome<\/family>/g' ~/.config/fontconfig/conf.d/10-symbols.conf &>/dev/null
