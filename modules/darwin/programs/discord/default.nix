{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.discord;
in {
  options.${namespace}.programs.discord = {
    enable = lib.mkEnableOption "discord";
  };

  config = lib.mkIf cfg.enable {
    homebrew.casks = ["discord"];
  };
}
