{inputs, ...}: {
  programs.git.enable = true;

  programs.fastfetch.enable = true;

  programs.zsh.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };

  # programs.mise = {
  #   enable = true;
  #   enableFishIntegration = true;

  #   globalConfig = {
  #     settings = {
  #       idiomatic_version_file_enable_tools = [];
  #     };
  #   };
  # };
}
