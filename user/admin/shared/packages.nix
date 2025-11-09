{
  inputs,
  config,
  pkgs,
  ...
}: let
  dotfiles = "${config.home.homeDirectory}/nix/dotfiles"; # todo: store in centralised config at root level with other shit
in {
  home.packages = with pkgs; [
    ffmpeg-full
    eternal-terminal
    video-compare

    btop
    sd
    jless
    gron
    curlie
    hyperfine
    hexyl
    csvlens
    pastel

    nerd-fonts.caskaydia-mono
    licensed-fonts.berkeley-mono
    licensed-fonts.gill-sans
    licensed-fonts.palatino
  ];

  programs = {
    yt-dlp.enable = true;

    btop.enable = true;

    neovim = {
      enable = true;

      defaultEditor = true;
    };

    bat = {
      enable = true;

      config = {
        style = "plain";
      };
    };

    eza = {
      enable = true;
    };

    fzf = {
      enable = true;
    };

    jq.enable = true;

    ripgrep.enable = true;

    fd.enable = true;

    vivid = {
      enable = true;

      activeTheme = "gruvbox-dark"; # vivid themes | fzf --preview 'vivid preview {}'
    };

    zen-browser = {
      enable = true;

      profiles.default = {
        extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          # onepassword-password-manager
          # refined-github
          ublock-origin
          sponsorblock
          violentmonkey
        ];
      };

      policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };
    };

    mpv.enable = true;
  };

  xdg.configFile = {
    "mpv".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/mpv";
  };
}
