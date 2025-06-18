{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.zsh;
in {
  options.${namespace}.programs.zsh = {
    enable = lib.mkEnableOption "zsh";
    autosuggestionEnable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    historyExtended = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = cfg.autosuggestionEnable;
      history.extended = cfg.historyExtended;
      profileExtra = ''
        eval "$(/opt/homebrew/bin/brew shellenv)"
      '';
    };
  };
}
