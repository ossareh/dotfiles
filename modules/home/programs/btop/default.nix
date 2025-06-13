{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.btop;
in {
  options.${namespace}.programs.btop = {
    enable = lib.mkEnableOption "btop";
  };

  config = lib.mkIf cfg.enable {
    programs.btop = {
      enable = true;
    };
  };
}
