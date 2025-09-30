{...}: {
  imports = [
    ../../base/macos

    ../shared

    ./ghostty.nix
    ./packages.nix
  ];

  home.homeDirectory = "/Users/admin";
}
