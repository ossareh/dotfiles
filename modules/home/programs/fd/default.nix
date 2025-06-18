{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.fd;
in {
  options.${namespace}.programs.fd = {
    enable = lib.mkEnableOption "fd";
  };

  config = lib.mkIf cfg.enable {
    programs.fd.enable = true;
  };
}
