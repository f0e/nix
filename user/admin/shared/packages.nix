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

    inputs.nix-licensed-fonts.packages.${pkgs.system}.berkeley-mono
    inputs.nix-licensed-fonts.packages.${pkgs.system}.gill-sans
    inputs.nix-licensed-fonts.packages.${pkgs.system}.palatino
  ];

  programs.neovim.enable = true;

  programs.thunderbird = {
    enable = true;

    profiles."default".isDefault = true;
  };
}
