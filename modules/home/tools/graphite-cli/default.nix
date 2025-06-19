{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.tools.graphite-cli;
in {
  options.${namespace}.tools.graphite-cli = {
    enable = lib.mkEnableOption "graphite-cli";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      graphite-cli
    ];
  };
}
