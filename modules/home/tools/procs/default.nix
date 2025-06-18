{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.tools.procs;
in {
  options.${namespace}.tools.procs = {
    enable = lib.mkEnableOption "procs";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      procs
    ];
  };
}
