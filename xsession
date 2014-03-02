#!/bin/bash
if [ $HOSTNAME == 'wafer' ]; then
    xmodmap ~/.Xmodmap &
fi
set -e -u -o pipefail
xrdb -merge ~/.Xresources
awesome
