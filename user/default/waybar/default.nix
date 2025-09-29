{ inputs, lib, config, pkgs, ... }:
{ 
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = builtins.fromJSON (builtins.readFile ./src/config.jsonc);
    };
  };

  # programs.waybar.style = builtins.readFile ./src/style.css;

  home.file = {
    "${config.xdg.configHome}/waybar/style.css" = {
      source = config.lib.meta.mkMutableSymlink ./src/style.css;
    };
  };

  # network / bluetooth applets
  home.packages = with pkgs; [
    networkmanagerapplet
    gnome-network-displays
  ];
}