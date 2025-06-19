{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.programs.devenv;
in {
  options.${namespace}.programs.devenv = {
    enable = lib.mkEnableOption "devenv";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      devenv
    ];
  };
}
