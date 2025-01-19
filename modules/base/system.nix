{
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # add all admins to the trusted user set
  nix.settings.trusted-users = ["@admin"];
}
