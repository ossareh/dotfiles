{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.tools.nodejs;
in {
  options.${namespace}.tools.nodejs = {
    enable = lib.mkEnableOption "nodejs";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nodejs
    ];
  };
}
