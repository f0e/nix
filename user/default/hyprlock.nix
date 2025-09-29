{...}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        no_fade_in = true;
        grace = 1;
        disable_loading_bar = false;
        hide_cursor = true;
        ignore_empty_input = true;
        text_trim = true;
      };

      background = {
        path = "/home/admin/Downloads/Gz4_zCxbAAMEdZD.jpeg"; # todo: dynamic
      };

      input-field = {
        monitor = "DP-4"; # todo: nicer way of doing this
        size = "300, 40";
        position = "0, 0";
        halign = "center";
        valign = "center";

        outline_thickness = 4;

        font_family = "JetBrains Mono Nerd Font";
        font_size = 12;

        placeholder_text = "password";
        check_color = "rgba(131, 192, 146, 1.0)";
        fail_text = "Wrong";

        rounding = 10;
        shadow_passes = 0;
        fade_on_empty = false;
      };
    };
  };
}
