{
  description = "tekno's system flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };

    nixpkgs-master = {
      url = "github:NixOS/nixpkgs/master";
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

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-claude-code = {
      url = "github:ryoppippi/nix-claude-code";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nix-darwin,
    nix-licensed-fonts,
    ...
  } @ inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/desktop/configuration.nix
          {
            nixpkgs.overlays = [
              inputs.nur.overlays.default

              (final: prev: {
                licensed-fonts = nix-licensed-fonts.overlays.default final prev;
              })
            ];
          }
        ];
      };
    };

    darwinConfigurations = {
      macbook-13 = nix-darwin.lib.darwinSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/macbook-13/configuration.nix
          {
            nixpkgs.overlays = [
              inputs.nur.overlays.default

              (final: prev: {
                licensed-fonts = nix-licensed-fonts.overlays.default final prev;

                curl-impersonate =
                  inputs.nixpkgs-master.legacyPackages.${prev.system}.curl-impersonate;
              })
            ];
          }
        ];
      };
    };
  };
}
