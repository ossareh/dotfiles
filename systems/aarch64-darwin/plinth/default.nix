{...}: {
  system.stateVersion = 6;
  system.primaryUser = "ossareh";

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
