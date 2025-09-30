{...}: {
  imports = [
    ./1password.nix
    ./direnv.nix
    ./ghostty.nix
    ./packages.nix
    ./shell.nix
    ./spicetify.nix
  ];

  home.username = "admin";
}
