{
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;
in {
  ossarehnix = {
    stacks = {
      comms = enabled;
      tools = enabled;
    };

    programs = {
      bat = enabled;
      direnv = enabled;
      eza = enabled;
      gh = enabled;
      git = enabled;
      ripgrep = enabled;
      starship = enabled;
      wezterm = enabled;
      zedEditor = enabled;
      zellij = enabled;
      zoxide = enabled;
      zsh = enabled;
    };
  };

  home.stateVersion = "25.05";
}
