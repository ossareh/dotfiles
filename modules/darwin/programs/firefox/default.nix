{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.firefox;
in {
  options.${namespace}.programs.firefox = {
    enable = lib.mkEnableOption "firefox";
  };

  config = lib.mkIf cfg.enable {
    homebrew.casks = ["firefox@developer-edition"];
  };
}
