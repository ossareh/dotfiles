{
  pkgs,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled disabled;

  username = "ossareh";
in {
  ossarehnix = {
    ux.dock.largeTileSize = 48;

    bundles = {
      comms = enabled;
      development = enabled;
    };

    homebrew.systemOwner = username;
    programs = {
      _1password = enabled;
      claude = enabled;

      firefox = enabled;

      appflowy = enabled;
      fantastical = enabled;
      garmin-express = enabled;

      # not ready to add this to comms yet
      microsoft-teams = disabled;

      spotify = enabled;

      wezterm = disabled;
      ghostty = enabled;

      # home-networking
      winbox = enabled;
    };
  };

  system.stateVersion = 6;
  system.primaryUser = username;

  networking = {
    computerName = "Ossareh's Laptop";
    hostName = "plinth";
    localHostName = "plinth";
    wakeOnLan = disabled;
  };

  nix.settings = {
    cores = 8;
    max-jobs = 8;

    experimental-features = "nix-command flakes";

    trusted-users = ["@admin"];

    # use caches
    substituters = [
      "https://cache.nixos.org"
      "https://ossareh.cachix.org"
      "https://pre-commit-hooks.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "ossareh.cachix.org-1:qk9AlH0oG2y7Cw2TonUjE6Ji8RnLNUSrU+nFhIYQ8IM="
      "pre-commit-hooks.cachix.org-1:Pkk3Panw5AW24TOv6kz3PvLhlH8puAsJTBbOPmBo7Rc="
    ];
  };

  environment.systemPackages = with pkgs; [
    cachix
    curl
  ];
}
