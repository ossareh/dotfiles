{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.zoxide;
in {
  options.${namespace}.programs.zoxide = {
    enable = lib.mkEnableOption "zoxide";
  };

  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
    };
  };
}
