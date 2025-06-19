{
  config,
  namespace,
  lib,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.bundles.system-observation;
in {
  options.${namespace}.bundles.system-observation = {
    enable = lib.mkEnableOption "system-observation";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix = {
      programs = {
        btop = enabled;
        dogdns = enabled;
        duf = enabled;
        dust = enabled;
        procs = enabled;
      };
    };
  };
}
