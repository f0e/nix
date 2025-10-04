{...}: {
  programs.git = {
    extraConfig.init.defaultBranch = "main";
  };
}
