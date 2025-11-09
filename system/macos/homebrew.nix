{...}: {
  homebrew = {
    enable = true;

    casks = [
      # need to install them like this to get integration working properly i guess
      # todo: revisit
      "1password"
      "brave-browser"

      # not in nixpkgs
      "plex"
      "plexamp"
      "battery"
    ];

    masApps = {
      tailscale = 1475387142;
      windows-app = 1295203466;
    };
  };
}
