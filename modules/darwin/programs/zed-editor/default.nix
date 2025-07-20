{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.programs.zed-editor;
in {
  options.${namespace}.programs.zed-editor = {
    enable = lib.mkEnableOption "zed-editor";
  };

  config = lib.mkIf cfg.enable {
    ossarehnix.homebrew = enabled;

    homebrew.casks = [
      {
        name = "zed";
        greedy = true;
      }
    ];
  };
}
