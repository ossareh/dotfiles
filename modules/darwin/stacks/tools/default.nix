{
  config,
  lib,
  pkgs,
  namespace,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.${namespace}.stacks.tools;
in {
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cachix
      curl
      git
      git-lfs
      gnugrep
      vim
    ];
  };
}
