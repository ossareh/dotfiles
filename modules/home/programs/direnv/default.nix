{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;
  cfg = config.${namespace}.programs.direnv;
in {
  options.${namespace}.programs.direnv = {
    enable = lib.mkEnableOption "direnv";
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv = enabled;
      silent = true;
      enableZshIntegration = true;
    };
  };
}
