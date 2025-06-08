{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    darwin,
    home-manager,
    ...
  }: {
    darwinConfigurations = {
      hench = darwin.lib.darwinSystem {
        specialArgs = {
          inherit inputs;
          hostOptions = {
            dock = {
              autohide = false;
              smallTileSize = 48;
            };
            additionalCasks = [
              {
                name = "logitech-options";
                greedy = true;
              }
            ];
          };
        };

        modules = [
          ./modules/base/system.nix
          ./modules/base/macos.nix
          ./modules/base/packages.nix
          ./modules/hosts/hench.nix
          {
            nixpkgs.overlays = [inputs.nur.overlays.default];
          }

          home-manager.darwinModules.home-manager
          {
            home-manager.backupFileExtension = "bkup";

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
        ];
      };
      plinth = darwin.lib.darwinSystem {
        specialArgs = {
          inherit inputs;
          hostOptions = {
            dock = {
              largeTileSize = 48;
              smallTileSize = 16;
            };
          };
        };

        modules = [
          ./modules/base/system.nix
          ./modules/base/macos.nix
          ./modules/base/packages.nix
          ./modules/hosts/plinth.nix
          {
            nixpkgs.overlays = [inputs.nur.overlays.default];
          }

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
