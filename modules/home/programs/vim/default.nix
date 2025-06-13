{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.vim;
in {
  options.${namespace}.programs.vim = {
    enable = lib.mkEnableOption "vim";
  };

  config = lib.mkIf cfg.enable {
    programs.vim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
