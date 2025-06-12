{
  nix.settings = {
    # Necessary for using flakes on this system.
    experimental-features = "nix-command flakes";

    # add all admins to the trusted user set
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

  # temporary while migration occurs
  system.primaryUser = "ossareh";
}
