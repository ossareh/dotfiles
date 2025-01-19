{inputs, ...}: {
  # all my macos are apple silicon
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # sanity
  system = {
    defaults = {
      dock = {
        autohide = false;
        largesize = 96;
        magnification = true;
        tilesize = 48;
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
