{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.ripgrep;
in {
  options.${namespace}.programs.ripgrep = {
    enable = lib.mkEnableOption "ripgrep";
  };

  config = lib.mkIf cfg.enable {
    programs.ripgrep = {
      enable = true;
    };
  };
}
