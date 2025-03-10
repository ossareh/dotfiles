{
  inputs,
  lib,
  hostOptions ? {},
  ...
}: let
  opts =
    lib.recursiveUpdate {
      dock = {
        autohide = true;
        largeTileSize = 96;
        smallTileSize = 16;
      };
      additionalCasks = [];
    }
    hostOptions;
in {
  # all my macos are apple silicon
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  homebrew.enable = true;
  homebrew.casks =
    [
      {
        name = "1password@beta";
        greedy = true;
      }
      {
        name = "appflowy";
        greedy = true;
      }
      {
        name = "discord";
        greedy = true;
      }
      {
        name = "fantastical";
        greedy = true;
      }
      {
        name = "firefox@developer-edition";
        greedy = true;
      }
      {
        name = "mailspring";
        greedy = true;
      }
      {
        name = "ollama";
        greedy = true;
      }
      {
        name = "signal@beta";
        greedy = true;
      }
      {
        name = "spotify";
        greedy = true;
      }
      {
        name = "telegram-desktop@beta";
        greedy = true;
      }
      {
        name = "whatsapp@beta";
        greedy = true;
      }
      {
        name = "winbox";
        greedy = true;
      }
      {
        name = "zoom";
        greedy = true;
      }
    ]
    ++ opts.additionalCasks;

  homebrew.masApps = {
    Reeder = 6475002485;
    Xcode = 497799835;
  };

  # sanity
  system = {
    defaults = {
      dock = {
        autohide = opts.dock.autohide;
        largesize = opts.dock.largeTileSize;
        magnification = true;
        tilesize = opts.dock.smallTileSize;
        minimize-to-application = true;
        wvous-tr-corner = 2;
        wvous-tl-corner = 5;
      };

      finder = {
        FXPreferredViewStyle = "clmv";
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      loginwindow.SHOWFULLNAME = true;

      menuExtraClock = {
        Show24Hour = true;
        ShowDate = 0;
      };

      screensaver = {
        askForPassword = true;
        askForPasswordDelay = 5;
      };

      NSGlobalDomain = {
        AppleShowAllFiles = true;
        InitialKeyRepeat = 11;
        KeyRepeat = 4;
        # "Natural" Scrolling
        "com.apple.swipescrolldirection" = false;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };

  power = {
    sleep = {
      display = 5;
      computer = 10;
    };
  };
}
