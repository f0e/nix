{
  description = "tekno's system flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-licensed-fonts = {
      type = "git";
      url = "ssh://git@github.com/f0e/nix-licensed-fonts.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nix-darwin,
    nix-licensed-fonts,
    ...
  } @ inputs: let
    commonModules = [
      {
        nixpkgs.overlays = [
          (final: prev: {
            licensed-fonts = nix-licensed-fonts.packages.${final.system};
          })
        ];
      }
    ];
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules =
          commonModules
          ++ [
            ./hosts/desktop/configuration.nix
          ];
      };
    };

    darwinConfigurations = {
      macbook-13 = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {inherit inputs;};
        modules =
          commonModules
          ++ [
            ./hosts/macbook-13/configuration.nix
          ];
      };
    };
  };
}
