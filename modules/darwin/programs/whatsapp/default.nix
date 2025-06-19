{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.whatsapp;
in {
  options.${namespace}.programs.whatsapp = {
    enable = lib.mkEnableOption "whatsapp";
  };

  config = lib.mkIf cfg.enable {
    homebrew.casks = ["whatsapp@beta"];
  };
}
