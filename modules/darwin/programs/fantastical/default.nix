{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.fantastical;
in {
  options.${namespace}.programs.fantastical = {
    enable = lib.mkEnableOption "fantastical";
  };

  config = lib.mkIf cfg.enable {
    homebrew.casks = ["fantastical"];
  };
}
