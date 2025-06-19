{
  config,
  lib,
  namespace,
  pkgs,
  ...
}: let
  cfg = config.${namespace}.programs.bat;
in {
  options.${namespace}.programs.bat = {
    enable = lib.mkEnableOption "bat";
  };

  config = lib.mkIf cfg.enable {
    programs.bat = {
      enable = true;
      config = {
        theme = "Nord";
      };
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        batman
        batpipe
        batwatch
        prettybat
      ];
    };
    home.shellAliases = {
      cat = "${lib.getExe pkgs.bat} --style=plain";
    };
  };
}
