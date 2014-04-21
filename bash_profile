#!/bin/bash

# eject if not interactive
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
PS2='> '
PS3='> '
PS4='+ '

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
                                                        
    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

# read files in ~/.profile.d
PROFILE_D=~/.profile.d
if [ -d ${PROFILE_D} ]; then
    for f in ${PROFILE_D}/*.sh; do
        test -r "${f}" && . "${f}"
    done
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

# heroku toolbelt
HEROKU_PATH=/usr/local/heroku
if [ -d ${HEROKU_PATH} ]; then
    export PATH=${HEROKU_PATH}/bin:$PATH
fi

# GoLang
GOROOT=~/dev/oss/go
if [ -d ${GOROOT} ]; then
    export GOROOT
    export PATH=${GOROOT}/bin:$PATH
fi

GOPATH=~/dev/go
if [ -d ${GOPATH} ]; then
    export GOPATH
    export PATH=${PATH}:${GOPATH}/bin
fi

# aws
AWS_AUTH=~/.aws/id.auth
if [ -f ${AWS_AUTH} ]; then
    source ${AWS_AUTH}
fi

# random
export GREP_OPTIONS='--color=always'
PDSH_SSH_ARGS_APPEND=-tt

# aliases
alias ls='ls --color=auto'
alias less='less -R'
alias emacs='emacsclient -t'
