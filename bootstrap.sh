#!/bin/bash
set -euo pipefail

mkdir -p ~/bin
mkdir -p ~/dev/src

# base packages
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/chrome.list

wget -q -O - https://www.virtualbox.org/download/oracle_vbox.asc | apt-key add -
echo "deb http://download.virtualbox.org/virtualbox/debian jessie contrib" > /etc/apt/sources.list.d/virtualbox.list

apt-get update -y
apt-get install -y \
        chrony \
        curl \
        dkms \
        emacs24-nox \
        git \
        google-chrome-stable \
        mercurial\
        python-pip \
        rxvt-unicode-256color \
        virtualbox-4.3


# Go Setup
curl -o /tmp/go.tgz -L https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz
echo "46eecd290d8803887dec718c691cc243f2175fe0  /tmp/go.tgz" | sha1sum -c
( mkdir -p ~/dev && cd ~/dev && tar xzf /tmp/go.tgz )

PATH=~/dev/go/bin:${PATH}
export GOROOT=~/dev/go
export GOPATH=~/dev

go get golang.org/x/tools/cmd/...


# Fonts
curl -o /tmp/scp.tgz -L https://github.com/adobe-fonts/source-code-pro/archive/1.017R.tar.gz
( mkdir -p ~/.fonts && cd ~/.fonts && tar xvf /tmp/scp.tgz && fc-cache -f -v )
echo "************************************************"
echo "You now need to run `fc-cache -f -v` as you user"
echo "************************************************"


# Dotfiles
pip install dotfiles
go get -d github.com/ossareh/Dotfiles
( cd ~/dev/src/github.com/ossareh/Dotfiles && git remote set-url origin git@github.com:ossareh/Dotfiles.git )
ln -s ~/dev/src/github.com/ossareh/Dotfiles ./Dotfiles
dotfiles -s ~/.dotfilesrc
dotfiles -s -f

# Setup rxvt
xrdb -merge ~/.Xresources

# Setup basic git things
echo "************************************************************"
echo "* You now need to run `git config --global` as your user   *"
echo "* for keys: `user.name`, `user.email`, and `color.ui auto` *"
echo "************************************************************"
