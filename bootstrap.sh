#!/bin/bash
set -euo pipefail

mkdir -p ~/bin
mkdir -p ~/dev/src

# base packages
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/chrome.list

# necessary for grpc dev locally
echo "deb http://ftp.us.debian.org/debian unstable main contrib non-free" > /etc/apt/sources.list.d/debian-unstable.list


apt-get update -y
apt-get install -y \
        chrony \
	curl \
        emacs24-nox \
        git \
	google-chrome-stable \
        mercurial\
        python-pip \
	rxvt-unicode-256color


# Go Setup
curl -o /tmp/go.tgz -L https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz
echo "5020af94b52b65cc9b6f11d50a67e4bae07b0aff  /tmp/go.tgz" | sha1sum -c
( cd ~/dev && tar xzf /tmp/go.tgz )

PATH=~/dev/go/bin:${PATH}
export GOROOT=~/dev/go
export GOPATH=~/dev

go get golang.org/x/tools/cmd/...


# Fonts
curl -o /tmp/scp.tgz -L https://github.com/adobe-fonts/source-code-pro/archive/1.017R.tar.gz
( mkdir ~/.fonts && cd ~/.fonts && tar xvf /tmp/scp.tgz && fc-cache -f -v )
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
