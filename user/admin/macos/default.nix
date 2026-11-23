{...}: {
  imports = [
    ../../base/macos

    ../shared

    ./discord.nix
    ./ghostty.nix
    ./packages.nix
    ./services.nix
    ./system.nix
  ];

  home.homeDirectory = "/Users/admin";
}
