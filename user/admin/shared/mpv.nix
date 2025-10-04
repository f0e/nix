{config, ...}: let
  dotfiles = "${config.home.homeDirectory}/nix/dotfiles"; # todo: store in centralised config at root level with other shit
in {
  programs.mpv.enable = true;

  xdg.configFile."mpv".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/mpv";
}
