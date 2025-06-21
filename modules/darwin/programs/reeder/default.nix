{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.reeder;
in {
  options.${namespace}.programs.reeder = {
    enable = lib.mkEnableOption "reeder";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.masApps = {Reeder = 6475002485;};
  };
}
