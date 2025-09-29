{...}: {
  imports = [
    ./1password.nix
    ./direnv.nix
    ./ghostty.nix
    ./packages.nix
    ./hyprpaper.nix
    ./shell.nix
    ./systemd.nix
  ];

  home.username = "admin";
  home.homeDirectory = "/home/admin";
}
