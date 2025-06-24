# Dotfiles

Nix managed dotfiles; heavily based on snowfall-org lib.

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
nh darwin switch ~/.config/dotfiles
```

## Next steps

- [x] add homebrew to PATH
- [x] integrate direnv for easy nix dev environments
- [x] prove above using this repo to get a markdown linter working
- [x] migrate manual home-brew installation
- [ ] implement a decent (but not amazing) nvim installation
- [ ] playbook for single user mode on remote boxen
