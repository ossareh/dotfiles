{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.gemini-cli;
in {
  options.${namespace}.programs.gemini-cli = {
    enable = lib.mkEnableOption "gemini-cli";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.brews = ["gemini-cli"];
  };
}
