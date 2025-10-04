{pkgs, ...}: {
  home.packages = with pkgs; [
    alt-tab-macos
    ice-bar
    shottr
    raycast
    iina
    keka

    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];
}
