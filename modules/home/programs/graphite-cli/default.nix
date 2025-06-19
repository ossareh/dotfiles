{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.programs.graphite-cli;
in {
  options.${namespace}.programs.graphite-cli = {
    enable = lib.mkEnableOption "graphite-cli";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      graphite-cli
    ];
  };
}
