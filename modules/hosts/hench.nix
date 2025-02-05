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
        ssh = {
          signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKYNYPXTBt6qIBM8OPxTcS6Mjwl8hr3+Ok2lKGPDHY8e";
        };
      };
    };
}
