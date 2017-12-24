CONFIG_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

declare -a configFiles=('.vimrc' '.tmux.conf' '.gitconfig')

for configFile in ${configFiles[@]}; do
    if [ ! -e ~/$configFile ]; then
        ln -s $CONFIG_FOLDER/$configFile ~
    fi
done

# Config files in other folders
declare -a configFolders=('i3' 'sway')

for configFolder in ${configFolders[@]}; do
    if [ ! -e ~/.config/i3 ]; then
        rm ~/.config/$configFolder/config
        ln -s $CONFIG_FOLDER/.$configFolder ~/.config/$configFolder/config
    fi
done
