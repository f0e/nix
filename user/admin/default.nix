{...}: {
  imports = [
    ./1password.nix
    ./ghostty.nix
    ./packages.nix
    ./hyprpaper.nix
    ./zsh.nix
  ];

  home.username = "admin";
  home.homeDirectory = "/home/admin";
}
