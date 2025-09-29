{
  pkgs,
  inputs,
  ...
}: {
  # System packages optimized for your setup
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
    alejandra
    nixd
    blueberry
    clipse
    fzf
    zoxide
    ripgrep
    eza
    fd
    curl
    gnumake
    libgcc
    wl-clipboard
    seahorse
    feh
  ];

  programs.hyprland = {
    enable = true;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.steam.enable = true;

  # 1password
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = ["admin"];
  };

  services.gnome.gnome-keyring.enable = true;

  programs.thunar.enable = true;
}
