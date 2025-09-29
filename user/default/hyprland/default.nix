{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./autostart.nix
    ./bindings.nix
    ./defaults.nix
    ./envs.nix
    ./input.nix
    ./looknfeel.nix
    ./monitors.nix
    ./windows.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
}
