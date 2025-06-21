{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.winbox;
in {
  options.${namespace}.programs.winbox = {
    enable = lib.mkEnableOption "winbox";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.casks = ["winbox"];
  };
}
