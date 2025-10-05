{pkgs, ...}: {
  launchd.agents.discord-music-rpc = {
    enable = true;
    config = {
      ProgramArguments = [
        "${pkgs.direnv}/bin/direnv"
        "exec"
        "/Users/admin/Desktop/code/discord-music-rpc"
        "uv"
        "run"
        "discord-music-rpc"
      ];
      WorkingDirectory = "/Users/admin/Desktop/code/discord-music-rpc";
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "/Users/admin/Library/Logs/discord-music-rpc.log";
      StandardErrorPath = "/Users/admin/Library/Logs/discord-music-rpc.error.log";
    };
  };
}
