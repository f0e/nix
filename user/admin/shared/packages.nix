{pkgs, ...}: {
  home.packages = with pkgs; [
    ffmpeg-full
    btop

    fd
    sd
    delta
    jless
    gron
    curlie
    hyperfine
    hexyl
    csvlens
    vivid
    pastel

    yt-dlp
  ];

  programs.neovim.enable = true;

  programs.thunderbird = {
    enable = true;

    profiles."default".isDefault = true;
  };
}
