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
      git.signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHhkLCu05Rl7UFs50qG34QZRiryrLWk0Eh18VeQ+pqBX ossareh@gmail.com";
      nodejs = enabled;
      snowfall-flake = enabled;
      vim = enabled;

      wezterm = {
        enable = true;
        config = builtins.readFile (lib.snowfall.fs.get-file "modules/home/config/wezterm.lua");
      };

      ghostty = {
        enable = true;
        config = builtins.readFile (lib.snowfall.fs.get-file "modules/home/config/ghostty");
      };

      zed-editor.config = import (lib.snowfall.fs.get-file "modules/home/config/zed_settings.nix");

      zsh = enabled;
    };

    fonts = enabled;
  };

  home.stateVersion = "25.05";
}
