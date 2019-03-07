# Folder where this repo was cloned
CONFIG_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Custom prompt
__GIT_PROMPT_DIR=$CONFIG_FOLDER/bash-git-prompt
GIT_PROMPT_THEME_FILE=$CONFIG_FOLDER/.git-prompt-colors.sh
source $CONFIG_FOLDER/bash-git-prompt/gitprompt.sh

# Increase history size
HISTSIZE=10000
HISTFILESIZE=100000

# Exit ranger in current dir
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
# Shortcut for quick activation
alias act='source activate "$(basename "$(pwd)")"'
