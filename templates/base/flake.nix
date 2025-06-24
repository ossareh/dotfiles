{
  description = "Base Template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    git-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;

      src = ./.;

      snowfall = {
        root = ./nix-config;

        namespace = "base-template";
        meta = {
          name = "base-template";
          title = "base-template";
        };
      };

      channels-config = {
        allowUnfree = true;
      };

      outputs-builder = channels: {formatter = channels.nixpkgs.nixfmt-rfc-style;};
    };
}
