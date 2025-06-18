{
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;
in {
  ossarehnix = {
    bundles = {
      development = enabled;
      shell-improvements = enabled;
      system-observation = enabled;
    };

    programs = {
      vim = enabled;
      wezterm = enabled;
      zsh = enabled;
    };

    tools = {
      nodejs = enabled;
    };

    fonts = enabled;
  };

  home.stateVersion = "25.05";
}
