{
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled;
in {
  ossarehnix = {
    programs.git.signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKYNYPXTBt6qIBM8OPxTcS6Mjwl8hr3+Ok2lKGPDHY8e";

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
