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
    enableBashIntegration = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    enableZshIntegration = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;

      enableBashIntegration = cfg.enableBashIntegration;
      enableZshIntegration = cfg.enableZshIntegration;
    };
  };
}
