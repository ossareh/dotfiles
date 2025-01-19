{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    darwin,
    home-manager,
    ...
  }: {
    darwinConfigurations = {
      hench = darwin.lib.darwinSystem {
        specialArgs = {inherit inputs;};

        modules = [
          ./modules/base/system.nix
          ./modules/base/macos.nix
          ./modules/base/packages.nix
          ./modules/hosts/hench.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.backupFileExtension = "bkup";

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
        ];
      };
      plinth = darwin.lib.darwinSystem {
        specialArgs = {inherit inputs;};

        modules = [
          ./modules/base/system.nix
          ./modules/base/macos.nix
          ./modules/base/packages.nix
          ./modules/hosts/plinth.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.backupFileExtension = "bkup";

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
        ];
      };
    };
  };
}
