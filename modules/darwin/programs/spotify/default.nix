{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.spotify;
in {
  options.${namespace}.programs.spotify = {
    enable = lib.mkEnableOption "spotify";
  };

  config = lib.mkIf cfg.enable {
    homebrew.casks = ["spotify"];
  };
}
