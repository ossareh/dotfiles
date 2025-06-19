{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.telegram;
in {
  options.${namespace}.programs.telegram = {
    enable = lib.mkEnableOption "telegram";
  };

  config = lib.mkIf cfg.enable {
    homebrew.casks = ["telegram-desktop@beta"];
  };
}
