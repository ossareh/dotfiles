{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.programs.dogdns;
in {
  options.${namespace}.programs.dogdns = {
    enable = lib.mkEnableOption "dogdns";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      dogdns
    ];
  };
}
