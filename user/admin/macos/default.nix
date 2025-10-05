{...}: {
  imports = [
    ../../base/macos

    ../shared

    ./ghostty.nix
    ./packages.nix
    ./services.nix
    ./system.nix
  ];

  home.homeDirectory = "/Users/admin";
}
