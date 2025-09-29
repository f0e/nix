{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    # Default applications
    "$terminal" = lib.mkDefault "ghostty";
    "$fileManager" = lib.mkDefault "thunar";
    "$browser" = lib.mkDefault "brave --new-window --ozone-platform=wayland";
    "$music" = lib.mkDefault "spotify --enable-features=UseOzonePlatform --ozone-platform=wayland";
    "$passwordManager" = lib.mkDefault "1password --ozone-platform-hint=x11"; # ssh approval broken on wayland? https://www.1password.community/discussions/developers/1password-fails-to-prompt-for-approval-when-using-hyprland/147361
    "$messenger" = lib.mkDefault "vesktop";
    "$webapp" = lib.mkDefault "$browser --app";
  };
}
