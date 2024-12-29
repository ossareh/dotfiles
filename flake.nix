{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    determinate.url = "https://flakehub.com/f/DeterminateSystems/nix/2.25.3.tar.gz";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, darwin, determinate, ... }: {
    darwinConfigurations = {
      nixpkgs.hostPlatform = "aarch64-darwin";

      plinth = darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };

        modules = [
          determinate.darwinModules.default
          ./modules/base/system.nix
          ./modules/base/packages.nix
        ];

      };
    };
  };
}
