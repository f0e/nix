{...}: {
  imports = [
    ./1password.nix
    ./direnv.nix
    ./ghostty.nix
    ./git.nix
    ./packages.nix
    ./shell.nix
    ./sops.nix
    ./spicetify.nix
  ];

  home.username = "admin";
}
