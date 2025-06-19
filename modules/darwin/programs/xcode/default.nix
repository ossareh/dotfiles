{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.xcode;
in {
  options.${namespace}.programs.xcode = {
    enable = lib.mkEnableOption "xcode";
  };

  config = lib.mkIf cfg.enable {
    homebrew.masApps = {Xcode = 497799835;};
  };
}
