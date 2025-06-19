{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.jq;
in {
  options.${namespace}.programs.jq = {
    enable = lib.mkEnableOption "jq";
  };

  config = lib.mkIf cfg.enable {
    programs.jq.enable = true;
  };
}
