{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.ghostty;
in {
  options.${namespace}.programs.ghostty = {
    enable = lib.mkEnableOption "ghostty";

    config = lib.mkOption {
      type = lib.types.str;
      default = '''';
      description = "ghostty";
    };
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/ghostty/config".text = cfg.config;
  };
}
