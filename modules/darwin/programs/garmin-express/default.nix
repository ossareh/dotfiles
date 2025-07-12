{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.garmin-express;
in {
  options.${namespace}.programs.garmin-express = {
    enable = lib.mkEnableOption "garmin-express";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.casks = ["garmin-express"];

    system.activationScripts.extraActivation.text = ''
      softwareupdate --install-rosetta --agree-to-license
    '';
  };
}
