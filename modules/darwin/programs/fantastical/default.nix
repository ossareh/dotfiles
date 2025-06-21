{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.fantastical;
in {
  options.${namespace}.programs.fantastical = {
    enable = lib.mkEnableOption "fantastical";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.casks = ["fantastical"];
  };
}
