{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.wezterm;
in {
  options.${namespace}.programs.wezterm = {
    enable = lib.mkEnableOption "wezterm";

    config = lib.mkOption {
      type = lib.types.str;
      default = ''
        local config = {}
        return config
      '';
      description = "wezterm lua configuration";
    };
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/wezterm/wezterm.lua".text = cfg.config;
  };
}
