{
  config,
  namespace,
  lib,
  ...
}: let
  cfg = config.${namespace}.programs.appflowy;
in {
  options.${namespace}.programs.appflowy = {
    enable = lib.mkEnableOption "appflowy";
  };

  config = lib.mkIf cfg.enable {
    homebrew.casks = ["appflowy"];
  };
}
