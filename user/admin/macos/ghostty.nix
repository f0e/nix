{pkgs-unstable, ...}: {
  programs.ghostty = {
    package = pkgs-unstable.ghostty-bin;

    settings = {
      # macos-titlebar-style = "tabs"
      macos-icon = "custom-style";
      # macos-icon-frame = "plastic"
      macos-icon-ghost-color = "ffffff";
      macos-icon-screen-color = "000000";
      # macos-option-as-alt = true

      window-colorspace = "display-p3";
    };
  };
}
