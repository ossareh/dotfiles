{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.zellij;
in {
  options.${namespace}.programs.zellij = {
    enable = lib.mkEnableOption "zellij";
    enableZshIntegration = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    attachExistingSession = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    exitShellOnExit = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      enableZshIntegration = cfg.enableZshIntegration;
      attachExistingSession = cfg.attachExistingSession;
      exitShellOnExit = cfg.exitShellOnExit;
    };
  };
}
