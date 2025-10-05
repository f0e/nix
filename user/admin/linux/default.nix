{...}: {
  imports = [
    ../../base/linux

    ../shared

    ./hyprpaper.nix
    ./packages.nix
    ./services.nix
  ];

  home.homeDirectory = "/home/admin";
}
