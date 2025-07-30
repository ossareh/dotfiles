{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.microsoft-teams;
in {
  options.${namespace}.programs.microsoft-teams = {
    enable = lib.mkEnableOption "microsoft-teams";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.casks = ["microsoft-teams"];
  };
}
