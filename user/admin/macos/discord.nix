{pkgs, ...}: {
  programs.discord = {
    enable = true;
    settings = {
      SKIP_HOST_UPDATE = true;
    };
    package = pkgs.discord.override {
      withEquicord = true;
      withOpenASAR = true;
    };
  };
}
