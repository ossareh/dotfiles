{
  config,
  namespace,
  lib,
  ...
}: let
  homebrewUpdateWindow = 3 * 24 * 60 * 60; # seconds in three days

  cfg = config.${namespace}.homebrew;
in {
  options.${namespace}.homebrew = {
    enable = lib.mkEnableOption "homebrew";
  };

  config = lib.mkIf cfg.enable {
    environment.variables = {
      # setting this in an attempt to provide some sort of
      # stability around updates
      HOMEBREW_AUTO_UPDATE_SECS = toString homebrewUpdateWindow;
      HOMEBREW_NO_ANALYTICS = "1";
      HOMEBREW_NO_INSECURE_REDIRECT = "1";
      HOMEBREW_NO_ENV_HINTS = "1";
    };

    homebrew = {
      enable = true;

      onActivation = {
        autoUpdate = true;
        upgrade = true;
      };
    };
  };
}
