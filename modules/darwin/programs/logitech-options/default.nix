{
  config,
  namespace,
  lib,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.logitech-options;
in {
  options.${namespace}.programs.logitech-options = {
    enable = lib.mkEnableOption "logitech-options";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.casks = ["logitech-options"];
  };
}
