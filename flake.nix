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

    nixcord = {
      url = "github:kaylorben/nixcord";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };

    mac-app-util = {
      url = "github:hraban/mac-app-util";
    };
  };

  outputs = {
    nixpkgs,
    nix-darwin,
    home-manager,
    mac-app-util,
    ...
  } @ inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };
    };

    darwinConfigurations = {
      macbook-13 = nix-darwin.lib.darwinSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/macbook-13/configuration.nix
        ];
      };
    };
  };
}
