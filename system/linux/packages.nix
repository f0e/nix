{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    vim
    wget
    tree
    wofi
    nwg-look
    unzip
    libnotify
    hyprshot
    hyprpicker
    hyprsunset
    brightnessctl
    pamixer
    playerctl
    gnome-themes-extra
    pavucontrol
    blueberry
    clipse
    curl
    wl-clip-persist
    wl-clipboard
    seahorse
    feh
    hyprpolkitagent
    gparted
  ];

  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  services.gnome.gnome-keyring.enable = true;

  programs.thunar.enable = true;

  programs.steam.enable = true;

  # 1password
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    _1password-gui.polkitPolicyOwners = ["admin"]; # todo: not hardcode
  };
}
