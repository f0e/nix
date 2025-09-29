{
  pkgs,
  inputs,
  config,
  ...
}: {
  programs.ghostty = {
    settings = {
      auto-update = "off";

      theme = "iTerm2 Pastel Dark Background";

      window-padding-x = 5;
      window-padding-y = 5;

      window-padding-color = "background";

      font-family = "CaskaydiaMono NF"; # todo: this should be global or smth
      font-size = 11;
      font-thicken = true;
      font-thicken-strength = 64;

      # disable ligatures
      font-feature = [
        "-calt"
        "-liga"
        "-dlig"
      ];
    };
  };
}
