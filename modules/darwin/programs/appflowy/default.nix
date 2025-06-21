{
  config,
  namespace,
  lib,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.appflowy;
in {
  options.${namespace}.programs.appflowy = {
    enable = lib.mkEnableOption "appflowy";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.casks = ["appflowy"];
  };
}
