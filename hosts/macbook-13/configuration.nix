{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let
  taps = {
    "homebrew/homebrew-core" = inputs.homebrew-core;
    "homebrew/homebrew-cask" = inputs.homebrew-cask;
  };
in {
  imports = [
    ../../system/macos
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  nix-homebrew = {
    enable = true;

    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
    enableRosetta = true;

    # User owning the Homebrew prefix
    user = "admin";

    inherit taps;

    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    global.autoUpdate = false;

    # The `cleanup = "zap"` field causes brew to try untapping taps that don't appear in the brewfile bundle,
    # so we repeat them here just to get them in the brewfile.
    # See also: https://github.com/zhaofengli/nix-homebrew/issues/5
    taps = lib.attrNames taps;
    onActivation.cleanup = "zap";
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };

    users = {
      "admin" = import ./users/admin.nix;
    };
  };

  # TODO: remove once https://github.com/nix-community/home-manager/pull/7915 is merged
  home-manager.sharedModules = [
    {
      targets.darwin.linkApps.enable = lib.mkDefault false;
    }
  ];

  system.build.applications = lib.mkForce (
    pkgs.buildEnv {
      name = "system-applications";
      pathsToLink = "/Applications";
      paths =
        config.environment.systemPackages
        ++ (lib.concatMap (x: x.home.packages) (lib.attrsets.attrValues config.home-manager.users));
    }
  );

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # # https://github.com/nix-community/home-manager/issues/1341#issuecomment-3256894180
  # home-manager.sharedModules = [
  #   inputs.nixcord.homeModules.nixcord
  #   (
  #     {...}: {
  #       targets.darwin.linkApps.enable = false;
  #     }
  #   )
  # ];
  # system.build.applications = lib.mkForce (
  #   pkgs.buildEnv {
  #     name = "system-applications";
  #     pathsToLink = "/Applications";
  #     paths =
  #       config.environment.systemPackages
  #       ++ (lib.concatMap (x: x.home.packages) (lib.attrsets.attrValues config.home-manager.users));
  #   }
  # );

  nixpkgs.config.allowUnfree = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users = {
    admin = {
      name = "admin";
      home = "/Users/admin";
    };
  };

  system.primaryUser = "admin";

  environment.etc."current-home-manager-packages".text = let
    packages = builtins.map (p: "${p.name}") config.home-manager.users."admin".home.packages;

    sortedUnique = builtins.sort builtins.lessThan (pkgs.lib.lists.unique packages);
    formatted = pkgs.lib.strings.concatLines sortedUnique;
  in
    formatted;

  environment.etc."current-system-packages".text = let
    packages = builtins.map (p: "${p.name}") config.environment.systemPackages;

    sortedUnique = builtins.sort builtins.lessThan (pkgs.lib.lists.unique packages);
    formatted = pkgs.lib.strings.concatLines sortedUnique;
  in
    formatted;
}
