{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ffmpeg-full
    eternal-terminal

    btop
    sd
    jless
    gron
    curlie
    hyperfine
    hexyl
    csvlens
    pastel

    nerd-fonts.caskaydia-mono
    licensed-fonts.berkeley-mono
    licensed-fonts.gill-sans
    licensed-fonts.palatino
  ];

  programs = {
    yt-dlp.enable = true;

    btop.enable = true;

    neovim = {
      enable = true;

      defaultEditor = true;
    };

    bat = {
      enable = true;

      config = {
        style = "plain";
      };
    };

    eza = {
      enable = true;

      enableFishIntegration = true;
    };

    fzf = {
      enable = true;

      enableFishIntegration = true;
    };

    jq.enable = true;

    ripgrep.enable = true;

    fd.enable = true;

    vivid = {
      enable = true;

      activeTheme = "gruvbox-dark"; # vivid themes | fzf --preview 'vivid preview {}'

      enableFishIntegration = true;
    };

    thunderbird = {
      enable = true;

      profiles."default".isDefault = true;
    };
  };
}
