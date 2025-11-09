{pkgs, ...}: {
  home.packages = with pkgs; [
    nerd-fonts.symbols-only
  ];

  programs = {
    git.enable = true;

    fastfetch.enable = true;

    zsh.enable = true;

    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
    };

    mise = {
      enable = true;

      globalConfig = {
        tools = {
          node = "lts";
          "npm:http-server" = "latest";
        };

        settings = {
          idiomatic_version_file_enable_tools = [];
        };
      };
    };
  };
}
