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
      nodejs = enabled;
      vim = enabled;
      wezterm = enabled;
      zsh = enabled;
    };

    fonts = enabled;
  };

  home.stateVersion = "25.05";
}
