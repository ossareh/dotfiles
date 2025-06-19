{...}: {
  system.defaults = {
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

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  power = {
    sleep = {
      display = 5;
      computer = 10;
    };
  };
}
