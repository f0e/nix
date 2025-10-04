{...}: {
  imports = [
    ../../base/macos

    ../shared

    ./ghostty.nix
    ./packages.nix
    ./system.nix
  ];

  home.homeDirectory = "/Users/admin";
}
