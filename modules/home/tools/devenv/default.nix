{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.tools.devenv;
in {
  options.${namespace}.tools.devenv = {
    enable = lib.mkEnableOption "devenv";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      devenv
    ];
  };
}
