{
  config,
  namespace,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.fonts;
in {
  options.${namespace}.fonts = {
    enable = lib.mkEnableOption "fonts";
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig = enabled;
    home.packages = with pkgs; [
      cascadia-code
      font-awesome
    ];
  };
}
