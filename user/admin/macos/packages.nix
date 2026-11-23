{pkgs, ...}: {
  home.packages = with pkgs; [
    ice-bar
    shottr
    raycast
    iina
    keka
    duti
    imagemagick
    utm
    orbstack
    ollama
    claude-code
    sqlitebrowser

    # ipa/sideloading stuff
    ldid
    zsign
  ];
}
