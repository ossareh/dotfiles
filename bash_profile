#!/bin/bash

if [ -e /etc/bashrc ]; then
    source /etc/bashrc
fi

EDITOR=`which emacsclient`
if [ ! -x $EDITOR ]; then
    EDITOR=`which vim`
fi
export EDITOR
# http://stackoverflow.com/questions/5570451/how-to-start-emacs-server-only-if-it-is-not-started
export ALTERNATE_EDITOR=''

# ~/bin
export PATH=~/bin:${PATH}

# arcanist
ARC_PATH=~/dev/oss/arcanist/bin
if [ -d ${ARC_PATH} ]; then
    export PATH=${ARC_PATH}:${PATH}
fi

# rbenv
RBENV_PATH=~/dev/oss/rbenv/bin
if [ -d ${RBENV_PATH} ]; then
    export PATH=${RBENV_PATH}:${PATH}
    eval "$(rbenv init -)"
fi

# export TERM correctly
case "$TERM" in
    "rxvt-unicode-256color")
        export TERM=rxvt-unicode
        ;;
esac
