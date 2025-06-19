{
  config,
  namespace,
  lib,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.bundles.comms;
in {
  options.${namespace}.bundles.comms = {
    enable = lib.mkEnableOption "comms";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix = {
      programs = {
        discord = enabled;
        signal = enabled;
        telegram = enabled;
        whatsapp = enabled;
        zoom = enabled;
      };
    };
  };
}
