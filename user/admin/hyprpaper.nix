{
  config,
  pkgs,
  ...
}: {
  # todo: make this nice
  services.hyprpaper = {
    settings = {
      preload = [
        "/home/admin/Downloads/Gz4_zCxbAAMEdZD.jpeg"
      ];
      wallpaper = [
        ", /home/admin/Downloads/Gz4_zCxbAAMEdZD.jpeg"
      ];
    };
  };
}
