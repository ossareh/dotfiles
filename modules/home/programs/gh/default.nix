{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.gh;
in {
  options.${namespace}.programs.gh = {
    enable = lib.mkEnableOption "gh";
  };

  config = lib.mkIf cfg.enable {
    programs.gh = {
      enable = true;
    };
  };
}
