{pkgs, ...}: {
  home.packages = with pkgs; [
    alt-tab-macos
    ice-bar
    shottr
    raycast
    iina
    keka
    duti

    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];
}
