{
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;
in {
  ossarehnix = {
    programs.git.signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKYNYPXTBt6qIBM8OPxTcS6Mjwl8hr3+Ok2lKGPDHY8e";

    programs.zed-editor.config = import (lib.snowfall.fs.get-file "modules/home/config/zed_settings.nix");

    bundles = {
      development = enabled;
      shell-improvements = enabled;
      system-observation = enabled;
    };

    programs = {
      nodejs = enabled;
      snowfall-flake = enabled;
      vim = enabled;
      wezterm = enabled;
      zsh = enabled;
    };

    fonts = enabled;
  };

  home.stateVersion = "25.05";
}
