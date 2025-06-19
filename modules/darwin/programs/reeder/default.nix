{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.reeder;
in {
  options.${namespace}.programs.reeder = {
    enable = lib.mkEnableOption "reeder";
  };

  config = lib.mkIf cfg.enable {
    homebrew.masApps = {Reeder = 6475002485;};
  };
}
