{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.signal;
in {
  options.${namespace}.programs.signal = {
    enable = lib.mkEnableOption "signal";
  };

  config = lib.mkIf cfg.enable {
    homebrew.casks = ["signal@beta"];
  };
}
