# Dotfiles

This is a recent rewrite to use nix. I don't really _get_ nix. So there may be some weirdness in all of this.

Not managed via nix:
1. homebrew
2. browsers of choice (firefox)
3. tools not well integrated into nix (1password, ollama, winbox, fantastical)
4. mailspring (seemed wierd to have nix manage email but not calendar 🤷🏻‍♂️)

nix will manage putting the `brew` bin into your path.

## Steps

```sh
# install determinate-nix - recommended by: https://github.com/LnL7/nix-darwin
$ curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install

# clone this repo into place
git clone git@github.com:ossareh/dotfiles ~/.config/dotfiles
cd ~/.config/dotfiles

# install homebrew managed tools
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ /opt/homebrew/bin/brew bundle --no-lock

# install nix-darwin
nix run nix-darwin -- switch --flake ~/.config/nix-darwin
# restart shell

# to trigger a rebuild
darwin-rebuild switch --flake ~/.config/nix-darwin
# you can optionally specify target hosts
# darwin-rebuild switch --flake ~/.config/nix-darwin#plinth
```

## Next steps

- [] add homebrew to PATH
- [] integrate direnv for easy nix dev environments
- [] prove above using this repo to get a markdown linter working
- [] implement a decent (but not amazing) nvim installation
- [] playbook for single user mode on remote boxen
