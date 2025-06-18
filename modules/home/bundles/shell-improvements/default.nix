{
  config,
  namespace,
  lib,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.bundles.shell-improvements;
in {
  options.${namespace}.bundles.shell-improvements = {
    enable = lib.mkEnableOption "shell-improvements";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix = {
      programs = {
        bat = enabled;
        direnv = enabled;
        eza = enabled;
        fd = enabled;
        fzf = enabled;
        jq = enabled;
        ripgrep = enabled;
        starship = enabled;
        zellij = enabled;
        zoxide = enabled;
      };
    };
  };
}
