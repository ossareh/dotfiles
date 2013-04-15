#!/bin/bash

source /etc/bashrc

export EDITOR=`which emacsclient`

# ~/bin
export PATH=~/bin:${PATH}

# arcanist
ARCPATH=~/dev/oss/arcanist/bin
if [ -d ${ARCPATH} ]; then
    export PATH=${ARCPATH}:${PATH}
fi
