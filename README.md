# Dotfiles

This is a recent rewrite to use nix. I don't really _get_ nix. So there may be some weirdness in
all of this.

Not managed via nix:

1. homebrew
2. browsers of choice (firefox)
3. tools not well integrated into nix (1password, ollama, winbox, fantastical)
4. mailspring (seemed wierd to have nix manage email but not calendar 🤷🏻‍♂️)

nix manages putting `brew` into your path.

## Steps

```sh
# install determinate-nix - recommended by: https://github.com/LnL7/nix-darwin
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install

# clone this repo into place
git clone git@github.com:ossareh/dotfiles ~/.config/dotfiles
cd ~/.config/dotfiles

sudo nix run github:lnl7/nix-darwin#darwin-rebuild -- switch --flake github:ossareh/dotfiles

# restart shell

# to trigger a rebuild
nixre
```

## Next steps

- [x] add homebrew to PATH
- [x] integrate direnv for easy nix dev environments
- [x] prove above using this repo to get a markdown linter working
- [x] migrate manual home-brew installation
- [ ] implement a decent (but not amazing) nvim installation
- [ ] playbook for single user mode on remote boxen

things you're going to bring back:

casks for hench: logitech-options

settings per host:

- hench
  - dock
    - autohide = false
    - smallTileSize = 48
- plinth
  - dock
    - largeTileSize = 48
    - smallTileSize = 16
