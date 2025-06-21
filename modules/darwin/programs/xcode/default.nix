{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.xcode;
in {
  options.${namespace}.programs.xcode = {
    enable = lib.mkEnableOption "xcode";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.masApps = {Xcode = 497799835;};
  };
}
