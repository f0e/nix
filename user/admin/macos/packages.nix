{pkgs, ...}: {
  home.packages = with pkgs; [
    ice-bar
    shottr
    raycast
    iina
    keka
    duti
  ];
}
