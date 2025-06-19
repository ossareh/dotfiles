{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.programs.duf;
in {
  options.${namespace}.programs.duf = {
    enable = lib.mkEnableOption "duf";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      duf
    ];
  };
}
