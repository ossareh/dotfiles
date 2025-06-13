{
  config,
  lib,
  namespace,
  ...
}: let
  cfg = config.${namespace}.programs.zsh;
in {
  options.${namespace}.programs.zsh = {
    enable = lib.mkEnableOption "zsh";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      history.extended = true;
      # Note: The profileExtra depends on /opt/homebrew/bin/brew.
      # Ensure Homebrew is managed and available at this path if this is intended.
      # profileExtra = ''
      #   # Initialize Homebrew
      #   if [ -x "/opt/homebrew/bin/brew" ]; then
      #     eval "$(/opt/homebrew/bin/brew shellenv)"
      #   fi
      # '';
      # If you plan to use starship, you might want to add its init script here
      # or ensure starship.enableZshIntegration is true if that option exists.
      # For now, following the original ossareh.nix structure.
    };
  };
}
