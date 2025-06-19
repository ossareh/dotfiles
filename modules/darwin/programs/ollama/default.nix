{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.ollama;
in {
  options.${namespace}.programs.ollama = {
    enable = lib.mkEnableOption "ollama";
  };

  config = lib.mkIf cfg.enable {
    homebrew.casks = ["ollama"];
  };
}
