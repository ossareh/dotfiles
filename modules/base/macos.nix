{
  inputs,
  pkgs,
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
  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # this is the nix-darwin programs
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    package = pkgs._1password-gui-beta;
  };

  homebrew.enable = true;
  homebrew.onActivation = {
    autoUpdate = true;
    upgrade = true;
  };
  homebrew.casks =
    [
      {
        name = "appflowy";
      }
      {
        name = "discord";
      }
      {
        name = "fantastical";
      }
      {
        name = "firefox@developer-edition";
      }
      {
        name = "ollama";
      }
      {
        name = "signal@beta";
      }
      {
        name = "spotify";
      }
      {
        name = "telegram-desktop@beta";
      }
      {
        name = "whatsapp@beta";
      }
      {
        name = "winbox";
      }
      {
        name = "zoom";
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
