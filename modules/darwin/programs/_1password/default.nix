{
  config,
  namespace,
  lib,
  ...
}: let
  cfg = config.${namespace}.programs._1password;
in {
  options.${namespace}.programs._1password = {
    enable = lib.mkEnableOption "_1password";
  };

  config = lib.mkIf cfg.enable {
    programs._1password.enable = true;
    homebrew.casks = ["1password@beta"];
  };
}
