{...}: {
  programs.ghostty = {
    enable = true;

    settings = {
      auto-update = "off"; # nix handles it

      theme = "iTerm2 Pastel Dark Background";

      window-padding-x = 5;
      window-padding-y = 5;

      window-padding-color = "background";

      font-family = "BerkeleyMono Nerd Font";
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
