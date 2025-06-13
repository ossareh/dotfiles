{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.direnv;
in {
  options.${namespace}.programs.direnv = {
    enable = lib.mkEnableOption "direnv";
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
    };
  };
}
