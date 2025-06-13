{
  config,
  lib,
  pkgs,
  namespace,
  ...
}: let
  cfg = config.${namespace}.stacks.tools;
in {
  options.${namespace}.stacks.tools = {
    enable = lib.mkEnableOption "common system tools stack";
  };

  config = lib.mkIf cfg.enable {
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
