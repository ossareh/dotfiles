{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.programs.snowfall-flake;
in {
  options.${namespace}.programs.snowfall-flake = {
    enable = lib.mkEnableOption "snowfall-flake";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # via overlay; provides flake command: https://github.com/snowfallorg/flake?tab=readme-ov-file#usage
      snowfallorg.flake
    ];
  };
}
