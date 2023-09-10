# Dotfiles

Steps:

-   install zsh (unnecessary on mac)
-   install [oh-my-zsh](https://ohmyz.sh/#install)
-   install [Jetbrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)
-   install [gnupg](https://www.gnupg.org/) - `brew install gpg pinentry-mac`
-   install [rtx](https://rtx.pub) - `brew install jdx/tap/rtx`
-   install [chezmoi](https://www.chezmoi.io/) - `brew install chezmoi`
-   install tmux

Then run this:

```shell
# install dotfiles
$ chezmoi init ossareh
# install tools
$ rtx install --yes
```
