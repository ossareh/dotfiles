{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.winbox;
in {
  options.${namespace}.programs.winbox = {
    enable = lib.mkEnableOption "winbox";
  };

  config = lib.mkIf cfg.enable {
    homebrew.casks = ["winbox"];
  };
}
