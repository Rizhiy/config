CONFIG_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

declare -a configFiles=('.vimrc' '.tmux.conf' '.gitconfig' '.Xdefaults')

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

# Set default terminal to urxvt
export TERMINAL="urxvt"

# Prepend anaconda to path
export PATH=/home/rizhiy/anaconda3/bin:$PATH
