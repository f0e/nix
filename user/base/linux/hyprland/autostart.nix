{...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # "hypridle & mako & waybar & fcitx5"
      # "waybar"
      # "swaybg -i ~/.config/omarchy/current/background -m fill"
      "hyprsunset"
      "systemctl --user start hyprpolkitagent"
      "wl-clip-persist --clipboard regular & clipse -listen"

      "$passwordManager --silent"
      "steam -silent"

      "[workspace 2 silent] $terminal"
      "[workspace 3 silent] $music"
      "[workspace 4 silent] $browser"
      "[workspace 5 silent] $messenger"

      # "dropbox-cli start"  # Uncomment to run Dropbox
    ];

    exec = [
      "pkill -SIGUSR2 waybar || waybar"
    ];
  };
}
