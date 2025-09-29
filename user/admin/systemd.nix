{pkgs, ...}: {
  systemd.user.services.discord-music-rpc = {
    Install = {
      WantedBy = ["default.target"];
    };
    Service = {
      ExecStart = "${pkgs.direnv}/bin/direnv exec /home/admin/Desktop/code/discord-music-rpc uv run discord-music-rpc";
      WorkingDirectory = "/home/admin/Desktop/code/discord-music-rpc";
    };
  };
}
