{
  config,
  namespace,
  lib,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs._1password;
in {
  options.${namespace}.programs._1password = {
    enable = lib.mkEnableOption "_1password";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    programs._1password.enable = true;
    homebrew.casks = ["1password@beta"];
  };
}
