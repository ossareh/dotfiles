{
  config,
  namespace,
  lib,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.bundles.development;
in {
  options.${namespace}.bundles.development = {
    enable = lib.mkEnableOption "development";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix = {
      programs = {
        ollama = enabled;
        xcode = enabled;
      };
    };
  };
}
