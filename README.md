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

## MacOS

Assumes `homebrew` is installed

```shell
$ brew install chezmoi
$ chezmoi init https://github.com/ossareh/dotfiles.git
$ chezmoi apply -R
$ chsh -s `which zsh` `whoami`
```

restart your shell.


## Debian:

this does not work yet
