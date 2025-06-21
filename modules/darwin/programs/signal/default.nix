{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.signal;
in {
  options.${namespace}.programs.signal = {
    enable = lib.mkEnableOption "signal";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.casks = ["signal@beta"];
  };
}
