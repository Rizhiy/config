# Folder where this repo was cloned
shell="$(basename "$SHELL")"
if [ "$shell" = "bash" ]
then
    CONFIG_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
elif [ "$shell" = "zsh" ]
then
    CONFIG_FOLDER="$(dirname "$0")"
fi

# Increase history size
HISTSIZE=10000
HISTFILESIZE=100000

# Exit ranger in current dir
alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
# Shortcut for quick conda activation
alias act='conda activate "$(basename "$(pwd)")"'

# More consice man pages
cheat() {
    curl cheat.sh/"$1"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
