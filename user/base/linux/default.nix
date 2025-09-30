{
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    ../shared

    ./hyprland
    ./waybar
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./scripts.nix
    ./vscode.nix
  ];
}
