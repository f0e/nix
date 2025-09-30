{...}: {
  imports = [
    ../../base/linux

    ../shared

    ./hyprpaper.nix
    ./packages.nix
    ./systemd.nix
  ];

  home.homeDirectory = "/home/admin";
}
