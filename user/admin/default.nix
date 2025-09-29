{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    ./1password.nix
    ./ghostty.nix
    ./packages.nix
    ./hyprpaper.nix
  ];

  home.username = "admin";
  home.homeDirectory = "/home/admin";
}
