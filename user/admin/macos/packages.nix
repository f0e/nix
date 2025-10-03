{pkgs, ...}: {
  home.packages = with pkgs; [
    alt-tab-macos
    ice-bar
    shottr
    raycast
  ];
}
