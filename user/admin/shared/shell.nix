{
  config,
  home,
  ...
}: let
  dotfiles = "${config.home.homeDirectory}/nix/dotfiles"; # todo: store in centralised config at root level with other shit
in {
  programs = {
    fish = {
      enable = true;

      shellInit = ''
        set fish_greeting ""
      '';

      interactiveShellInit = ''
        # enable uv completions if using
        if type -q uv
            uv generate-shell-completion fish | source
        end
      '';
    };

    zsh = {
      initContent = ''
        if [[ $(ps -o command= -p "$PPID" | awk '{print $1}') != 'fish' ]]
        then
            exec fish -l
        fi
      '';
    };

    zoxide = {
      enable = true;

      options = ["--cmd cd"];
    };

    atuin = {
      enable = true;

      flags = ["--disable-up-arrow"];
    };

    starship = {
      enable = true;
    };
  };

  xdg.configFile = {
    "starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/starship.toml";
  };

  home.file.".hushlogin".text = "";
}
