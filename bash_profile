#!/bin/bash

if [ -e /etc/bashrc ]; then
    source /etc/bashrc
fi

export EDITOR=`which emacsclient`
if [ ! -x $EDITOR ]; then
    export EDITOR=`which vim`
fi

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
