{inputs, ...}: {
  programs.git.enable = true;

  programs.fastfetch.enable = true;

  programs.zsh.enable = true;

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
