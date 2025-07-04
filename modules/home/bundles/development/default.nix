{
  config,
  namespace,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.${namespace}) disabled enabled;

  cfg = config.${namespace}.bundles.development;
in {
  options.${namespace}.bundles.development = {
    enable = lib.mkEnableOption "development";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix = {
      programs = {
        devenv = disabled;
        gh = enabled;
        git = {
          enable = true;
          userName = "P. Michael Ossareh";
          userEmail = "ossareh@gmail.com";

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
        graphite-cli = enabled;
        ssh = enabled;
        zed-editor = enabled;
      };
    };
  };
}
