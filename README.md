# Dotfiles

These are required, but have not yet been integrated into the steps below.

## Theory

I'm writing this down because I'm worried I may be creating a cyclic relationship
between mise and chezmoi. I intend that not to happen.

Install chezmoi using your package manager, eg:

``` shell
$ brew install chezmoi

```

Then use chezmoi to bootstrap everything else:

``` shell
$ chezmoi init https://github.com/ossareh/dotfiles.git
$ chezmoi install --yes
```

Ultimately you want to move to nix but you don't have time to work that out. 

### Environment

doom-emacs is your editor, you may have to run `./emacs/bin/doom install` on a new machine

the intent is to start emacs in daemon mode: `emacs --daemon` and then connect to it with
`emacsclient -nw` when you want to hack

## Languages

### `zig`

```shell
# install zls and copy it into ~/bin
$ git clone github.com/zigtools/zls ~/dev/src/github.com/zigtools/zls
$ cd ~/dev/src/github.com/zigtools/zls && git checkout 0.13.0 # bump this if you bump zig
$ zig build -Doptimize=ReleaseSafe && cp zig-out/bin/zls ~/bin

```

## MacOS

Assumes `homebrew` is installed

```shell
$ brew install chezmoi
$ chezmoi init https://github.com/ossareh/dotfiles.git
$ chezmoi apply -R
$ chsh -s `which zsh` `whoami`
```

restart your shell.

