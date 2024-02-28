# Dotfiles

Steps:

- install zsh (unnecessary on mac)
- install [oh-my-zsh](https://ohmyz.sh/#install)
- install [Jetbrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)
- install [gnupg](https://www.gnupg.org/) - `brew install gpg pinentry-mac`
- install [mise](https://mise.jdx.dev) - `brew install mise`
- install [1password-cli](https://1password.com/downloads/command-line/) - `brew install --cask 1password-cli`
- install tmux

Then run this:

```shell
# install chezmoi
$ mise install chezmoi --yes
# install dotfiles
$ chezmoi init ossareh
# ^ clonse dotfiles and specifically: .config/mise/config.toml
# then install tools
$ mise install --yes
```
