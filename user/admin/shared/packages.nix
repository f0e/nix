{pkgs, ...}: {
  home.packages = with pkgs; [
    ffmpeg-full
    btop

    # todo: dedupe, move to system if it makes sense
    zoxide
    bat
    eza
    fd
    sd
    delta
    ripgrep
    jless
    fzf
    antidote
    gron
    curlie
    hyperfine
    hexyl
    atuin
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
