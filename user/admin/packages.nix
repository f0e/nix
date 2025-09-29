{pkgs, ...}: {
  home.packages = with pkgs; [
    ffmpeg-full
    mise
    vesktop
    spotify
    vscode
    vapoursynth
    vapoursynth-mvtools
    vapoursynth-bestsource
    clang-tools
    btop
    helvum

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
  ];

  programs.neovim.enable = true;

  programs.obs-studio.enable = true;

  programs.chromium = {
    enable = true;

    package = pkgs.brave;

    extensions = [
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
      "jinjaccalgkegednnccohejagnlnfdag" # violentmonkey
      "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
      "imiakeaigofbcfdjajmgjfnohjlekndg" # Display Reddit images natively in browser
    ];
  };

  programs.thunderbird = {
    enable = true;

    profiles."default".isDefault = true;
  };
}
