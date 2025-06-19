{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.programs.nh;
in {
  options.${namespace}.programs.nh = {
    enable = lib.mkEnableOption "nh";
  };

  config = lib.mkIf cfg.enable {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 5 --keep-since 7d";
      };
      flake = config.home.homeDirectory/.config/dotfiles;
    };

    home = {
      shellAliases = {
        nixre = "nh ${
          if pkgs.stdenv.hostPlatform.isDarwin
          then "darwin"
          else "os"
        } switch";
      };
    };
  };
}
