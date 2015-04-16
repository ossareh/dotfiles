#!/bin/bash

# eject if not interactive
[[ $- != *i* ]] && return

# read files in ~/.profile.d
PROFILE_D=~/.profile.d
if [ -d ${PROFILE_D} ]; then
    for f in ${PROFILE_D}/*.sh; do
        test -r "${f}" && . "${f}"
    done
fi

# ~/bin
export PATH=~/bin:${PATH}
