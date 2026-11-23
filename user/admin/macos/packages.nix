{pkgs, ...}: {
  home.packages = with pkgs; [
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
