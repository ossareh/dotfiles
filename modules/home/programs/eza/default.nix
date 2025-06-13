{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.eza;
in {
  options.${namespace}.programs.eza = {
    enable = lib.mkEnableOption "eza";
  };

  config = lib.mkIf cfg.enable {
    programs.eza = {
      enable = true;
      # Add any eza specific settings here if needed in the future
      # For now, only 'enable = true;' is specified in the original ossareh.nix

      extraOptions = [
        "--group-directories-first"
        "--header"
        "--hyperlink"
        "--follow-symlinks"
      ];

      git = true;
      icons = "auto";
    };

    home.shellAliases = {
      la = lib.mkForce "${lib.getExe config.programs.eza.package} -lah --tree";
      tree = lib.mkForce "${lib.getExe config.programs.eza.package} --tree --icons=always";
    };
  };
}
