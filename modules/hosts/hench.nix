{pkgs, ...}: {
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  users.users.ossareh = {
    name = "ossareh";
    home = "/Users/ossareh";
  };

  home-manager.users.ossareh = {lib, ...}:
    import ../common/ossareh.nix {
      pkgs = pkgs;
      lib = lib;
    };
}
