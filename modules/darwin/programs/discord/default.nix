{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.discord;
in {
  options.${namespace}.programs.discord = {
    enable = lib.mkEnableOption "discord";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.casks = ["discord"];
  };
}
