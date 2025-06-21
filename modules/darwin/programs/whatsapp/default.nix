{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.whatsapp;
in {
  options.${namespace}.programs.whatsapp = {
    enable = lib.mkEnableOption "whatsapp";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.casks = ["whatsapp@beta"];
  };
}
