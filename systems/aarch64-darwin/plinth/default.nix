{
  pkgs,
  lib,
  namespace,
  ...
}: let
  inherit (lib.${namespace}) disabled;
in {
  system.stateVersion = 6;
  system.primaryUser = "ossareh";

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

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };

    # Many of these are actually user specific and should in fact be installed from
    # homes/aarch64-darwin/ossareh@plinth/default.nix and not from here
    casks = [
      "appflowy"
      "discord"
      "fantastical"
      "firefox@developer-edition"
      "ollama"
      "signal@beta"
      "spotify"
      "telegram-desktop@beta"
      "whatsapp@beta"
      "winbox"
      "zoom"
    ];

    # Many of these are actually user specific and should in fact be installed from
    # homes/aarch64-darwin/ossareh@plinth/default.nix and not from here
    masApps = {
      Reeder = 6475002485;
      Xcode = 497799835;
    };
  };
}
