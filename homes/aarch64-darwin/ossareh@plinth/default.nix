{
  pkgs,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;
in {
  ossarehnix = {
    programs = {
      bat = enabled;
      btop = enabled;
      direnv = enabled;
      eza = enabled;
      fd = enabled;
      fzf = enabled;
      gh = enabled;
      git = {
        enable = true;
        userName = "P. Michael Ossareh";
        userEmail = "ossareh@gmail.com";
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHhkLCu05Rl7UFs50qG34QZRiryrLWk0Eh18VeQ+pqBX ossareh@gmail.com";

        extraConfig = {
          gpg = {
            format = "ssh";
            ssh = {
              # this is a bit goofy; 1password is installed via nix-darwin which is defined in
              # modules/base/macos.nix and referenced here. That is because I believe 1password
              # should be globally available and not user-scoped
              program = "${pkgs._1password-gui-beta}/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
            };
          };
          merge = {
            conflictsytle = "zdiff3";
          };

          # settings from: https://blog.gitbutler.com/how-git-core-devs-configure-git/
          column.ui = "auto";
          branch.sort = "-committerdate";
          tag.sort = "version:refname";
          init.defaultBranch = "main";
          diff = {
            algorithm = "histogram";
            colorMoved = "plain";
            menmonicPrefix = true;
            renames = true;
          };
          push = {
            default = "simple";
            autoSetupRemote = true;
            followTags = true;
          };
          fetch = {
            prune = true;
            pruneTags = true;
            all = true;
          };
          help.autocorrect = "prompt";
          commit.verbose = true;
          rerere = {
            enabled = true;
            autoupdate = true;
          };
          rebase = {
            autoSquash = true;
            autoStash = true;
            updateRefs = true;
          };
        };
      };
      jq = enabled;
      ripgrep = enabled;
      ssh = enabled;
      starship = enabled;
      vim = enabled;
      wezterm = enabled;
      zed-editor = enabled;
      zellij = enabled;
      zoxide = enabled;
      zsh = enabled;
    };

    tools = {
      devenv = enabled;
      dogdns = enabled;
      duf = enabled;
      dust = enabled;
      graphite-cli = enabled;
      nodejs = enabled;
      procs = enabled;
    };

    fonts = enabled;
  };

  home.stateVersion = "25.05";
}
