{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) types;
  cfg = config.${namespace}.programs.git;
in {
  options.${namespace}.programs.git = {
    enable = lib.mkEnableOption "git";
    userName = lib.mkOption {
      type = types.str;
      description = "The user name to use for git commits.";
    };
    userEmail = lib.mkOption {
      type = types.str;
      description = "The user email to use for git commits.";
    };
    signingKey = lib.mkOption {
      type = types.str;
      description = "The signing key to use for git commits.";
    };
    extraConfig = lib.mkOption {
      type = types.attrs;
      description = "Extra git configuration options.";
      default = {};
    };
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      lfs.enable = true;
      userName = cfg.userName;
      userEmail = cfg.userEmail;
      signing = {
        key = cfg.signingKey;
        signByDefault = true;
      };

      extraConfig = cfg.extraConfig;

      delta = {
        enable = true;
        options = {
          navigate = true;
          side-by-side = true;
          hyperlinks = true;

          commit-decoration-style = "blue ol";
          commit-style = "raw";
          file-style = "omit";
          hunk-header-decoration-style = "blue box";
          hunk-header-file-style = "red";
          hunk-header-line-number-style = "#067a00";
          hunk-header-style = "file line-number syntax";
        };
      };
    };
  };
}
