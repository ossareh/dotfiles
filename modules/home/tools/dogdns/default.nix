{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.tools.dogdns;
in {
  options.${namespace}.tools.dogdns = {
    enable = lib.mkEnableOption "dogdns";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      dogdns
    ];
  };
}
