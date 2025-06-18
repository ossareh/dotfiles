{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.tools.dust;
in {
  options.${namespace}.tools.dust = {
    enable = lib.mkEnableOption "dust";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      dust
    ];
  };
}
