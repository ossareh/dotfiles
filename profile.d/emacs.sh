EDITOR=`which emacsclient`
if [ ! -x $EDITOR ]; then
    EDITOR=`which vim`
fi
export EDITOR
# http://stackoverflow.com/questions/5570451/how-to-start-emacs-server-only-if-it-is-not-started
export ALTERNATE_EDITOR=''

# aliases
alias emacs='emacsclient -t'

