{
  pkgs,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) enabled disabled;
in {
  ossarehnix = {
    ux.dock = {
      autohide = false;
      smallTileSize = 48;
    };

    bundles = {
      comms = enabled;
      development = enabled;
    };

    programs = {
      _1password = enabled;
      logitech-options = enabled;

      firefox = enabled;

      appflowy = enabled;
      fantastical = enabled;

      reeder = enabled;
      spotify = enabled;
    };
  };

  system.stateVersion = 6;
  system.primaryUser = "ossareh";

  networking = {
    computerName = "Ossareh's Mac Studio";
    hostName = "hench";
    localHostName = "hench";
    wakeOnLan = disabled;
  };

  nix.settings = {
    cores = 24;
    max-jobs = 24;

    experimental-features = "nix-command flakes";

    trusted-users = ["@admin"];

    # use caches
    substituters = [
      "https://cache.nixos.org"
      "https://cache.nixos.org/"
      "https://ossareh.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "ossareh.cachix.org-1:qk9AlH0oG2y7Cw2TonUjE6Ji8RnLNUSrU+nFhIYQ8IM="
    ];
  };

  environment.systemPackages = with pkgs; [
    cachix
    curl
  ];
}
