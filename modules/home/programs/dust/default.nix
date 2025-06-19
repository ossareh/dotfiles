{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.programs.dust;
in {
  options.${namespace}.programs.dust = {
    enable = lib.mkEnableOption "dust";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      dust
    ];
  };
}
