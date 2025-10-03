{...}: {
  homebrew = {
    enable = true;

    casks = [
      # need to install them like this to get integration working properly i guess
      # todo: revisit
      "1password"
      "brave-browser"

      "battery"
    ];

    masApps = {
      tailscale = 1475387142;
    };
  };
}
