{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.programs.nodejs;
in {
  options.${namespace}.programs.nodejs = {
    enable = lib.mkEnableOption "nodejs";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nodejs
    ];
  };
}
