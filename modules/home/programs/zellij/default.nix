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
  };

  config = lib.mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      enableZshIntegration = true;
      attachExistingSession = true;
      exitShellOnExit = true;
    };
  };
}
