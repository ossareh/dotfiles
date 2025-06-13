{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.stacks.comms;
in {
  options.${namespace}.stacks.comms = {
    enable = lib.mkEnableOption "comms stack";
  };

  config = lib.mkIf cfg.enable {
    homebrew = {
      casks = [
        "discord"
        "signal@beta"
        "telegram-desktop@beta"
        "whatsapp@beta"
      ];
    };
  };
}
