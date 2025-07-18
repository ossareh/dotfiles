{
  inputs,
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
    systemOwner = lib.mkOption {
      type = lib.types.str;
      description = "User owning the Homebrew prefix";
    };
    migrate = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Migrate Homebrew prefix to a new user";
    };
  };

  config = lib.mkIf cfg.enable {
    # This configuration was previously in an inline module inside the `imports`
    # declaration, which is not the correct way to structure a module.
    nix-homebrew = {
      # Install Homebrew under the default prefix
      enable = true;

      # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
      enableRosetta = true;

      # User owning the Homebrew prefix
      user = cfg.systemOwner;

      # Optional: Declarative tap management
      taps = {
        "homebrew/homebrew-core" = inputs.homebrew-core;
        "homebrew/homebrew-cask" = inputs.homebrew-cask;
      };

      # Optional: Enable fully-declarative tap management
      #
      # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
      mutableTaps = false;

      autoMigrate = cfg.migrate;
    };

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
