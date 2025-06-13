{
  config,
  lib,
  pkgs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.git;
in {
  options.${namespace}.programs.git = {
    enable = lib.mkEnableOption "git";
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      lfs.enable = true;
      userName = "P. Michael Ossareh";
      userEmail = "ossareh@gmail.com";

      signing = {
        key =
          if config.user.ssh.signingKey == null
          # This assumes you will define `user.ssh.signingKey` in your top-level configuration
          # For example:
          # homeConfigurations."your-user" = home-manager.lib.homeManagerConfiguration {
          #   config = {
          #     user.ssh.signingKey = "~/.ssh/id_ed25519"; # Or your actual key path
          #     # ... other configurations
          #   };
          # };
          then builtins.throw "config.user.ssh.signingKey is not set. Please define it in your flake's home-manager configuration for this user."
          else config.user.ssh.signingKey;
        signByDefault = true;
      };

      extraConfig = {
        gpg = {
          format = "ssh";
          ssh = {
            # This assumes pkgs._1password-gui-beta is available.
            # You might need to ensure this package is present in your pkgs input.
            program = "${pkgs._1password-gui-beta}/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
          };
        };
        merge = {
          conflictStyle = "zdiff3"; # Corrected from conflictsytle
        };
        column.ui = "auto";
        branch.sort = "-committerdate";
        tag.sort = "version:refname";
        init.defaultBranch = "main";
        diff = {
          algorithm = "histogram";
          colorMoved = "plain";
          mnemonicPrefix = true; # Corrected from menmonicPrefix
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

      delta = {
        enable = true;
        options = {
          "navigate" = true;
          "side-by-side" = true;
          "hyperlinks" = true;
          "commit-decoration-style" = "blue ol";
          "commit-style" = "raw";
          "file-style" = "omit";
          "hunk-header-decoration-style" = "blue box";
          "hunk-header-file-style" = "red";
          "hunk-header-line-number-style" = "#067a00";
          "hunk-header-style" = "file line-number syntax";
        };
      };
    };
  };
}
