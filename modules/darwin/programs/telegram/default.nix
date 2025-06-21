{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.telegram;
in {
  options.${namespace}.programs.telegram = {
    enable = lib.mkEnableOption "telegram";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.casks = ["telegram-desktop@beta"];
  };
}
