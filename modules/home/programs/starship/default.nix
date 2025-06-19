{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.starship;
in {
  options.${namespace}.programs.starship = {
    enable = lib.mkEnableOption "starship";
  };

  config = lib.mkIf cfg.enable {
    programs.starship.enable = true;
  };
}
