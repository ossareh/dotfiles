{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.zoom;
in {
  options.${namespace}.programs.zoom = {
    enable = lib.mkEnableOption "zoom";
  };

  config = lib.mkIf cfg.enable {
    homebrew.casks = ["zoom"];
  };
}
