{
  inputs,
  pkgs,
  ...
}: {
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

    nerd-fonts.caskaydia-mono
    licensed-fonts.berkeley-mono
    licensed-fonts.gill-sans
    licensed-fonts.palatino
  ];

  programs.neovim.enable = true;

  programs.thunderbird = {
    enable = true;

    profiles."default".isDefault = true;
  };
}
