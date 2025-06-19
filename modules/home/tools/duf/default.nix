{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.tools.duf;
in {
  options.${namespace}.tools.duf = {
    enable = lib.mkEnableOption "duf";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      duf
    ];
  };
}
