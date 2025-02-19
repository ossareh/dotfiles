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
      userOptions = {
        ssh.signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHhkLCu05Rl7UFs50qG34QZRiryrLWk0Eh18VeQ+pqBX ossareh@gmail.com";
      };
    };
}
