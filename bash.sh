# Folder where this repo was cloned
CONFIG_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Custom prompt
__GIT_PROMPT_DIR=$CONFIG_FOLDER/bash-git-prompt
GIT_PROMPT_THEME_FILE=$CONFIG_FOLDER/.git-prompt-colors.sh
source $CONFIG_FOLDER/bash-git-prompt/gitprompt.sh

# Point VIM to correct config
# Need to check this later
# MYVIMRC=~/config/.vimrc
if [ ! -e ~/.vimrc ]; then
    ln -s $CONFIG_FOLDER/.vimrc ~
fi

# Point tmux to correct config
if [ ! -e ~/.tmux.conf ]; then
    ln -s $CONFIG_FOLDER/.tmux.conf ~
fi
