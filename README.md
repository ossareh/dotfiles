# Dotfiles

These are required, but have not yet been integrated into the steps below.

- install [Jetbrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)
- install [1password-cli](https://1password.com/downloads/command-line/) - `brew install --cask 1password-cli`

## MacOS

Assumes `homebrew` is installed

```shell
$ brew install mise
$ eval "$(~/.local/bin/mise activate bash)"
$ mise use chezmoi --global --yes
$ chezmoi init ossareh
$ chezmoi apply -R
$ mise install --yes
$ chsh -s `which zsh` `whoami`
$ brew bundle
```


## Debian:

```shell
$ sudo apt update && sudo apt install --yes build-essential curl zsh
$ curl https://mise.run | sh
$ eval "$(~/.local/bin/mise activate bash)"
$ mise use chezmoi --global --yes
$ chezmoi init ossareh
$ chezmoi apply -R
$ mise install --yes
$ chsh -s `which zsh` `whoami`
```
