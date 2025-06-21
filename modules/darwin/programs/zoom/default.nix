{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.zoom;
in {
  options.${namespace}.programs.zoom = {
    enable = lib.mkEnableOption "zoom";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.casks = ["zoom"];
  };
}
