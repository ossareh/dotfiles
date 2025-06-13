{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf;

  cfg = config.${namespace}.stacks.comms;
in {
  config = mkIf cfg.enable {
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
