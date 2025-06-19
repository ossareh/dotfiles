{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.programs.procs;
in {
  options.${namespace}.programs.procs = {
    enable = lib.mkEnableOption "procs";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      procs
    ];
  };
}
