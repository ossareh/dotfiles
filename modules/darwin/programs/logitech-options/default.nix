{
  config,
  namespace,
  lib,
  ...
}: let
  cfg = config.${namespace}.programs.logitech-options;
in {
  options.${namespace}.programs.logitech-options = {
    enable = lib.mkEnableOption "logitech-options";
  };

  config = lib.mkIf cfg.enable {
    homebrew.casks = ["logitech-options"];
  };
}
