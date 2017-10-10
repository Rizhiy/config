CONFIG_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

declare -a configFiles=('.vimrc' '.tmux.conf' '.gitconfig')

for configFile in ${configFiles[@]}; do
    if [ ! -e ~/$configFile ]; then
        ln -s $CONFIG_FOLDER/$configFile ~
    fi
done

#i3 and sway
rm ~/.config/i3/config
rm ~/.config/sway/config
ln -s $CONFIG_FOLDER/.i3 ~/.config/i3/config
ln -s $CONFIG_FOLDER/.i3 ~/.config/sway/config
