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
    yaak

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

      withRuby = false;
      withPython3 = false;
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

      # atuin owns ctrl-r
      historyWidget.command = "";
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
        extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          # onepassword-password-manager
          # refined-github
          ublock-origin
          sponsorblock
          violentmonkey
        ];
      };

      # settings = {
      #   "uBlock0@raymondhill.net" = {
      #     settings = {
      #       # Get your settings here
      #       # ~/.zen/YOUR_PROFILE_NAME/browser-extension-data/uBlock0@raymondhill.net/storage.js
      #       advancedUserEnabled = true;
      #       selectedFilterLists = [
      #         "user-filters"
      #         "ublock-filters"
      #         "ublock-badware"
      #         "ublock-privacy"
      #         "ublock-unbreak"
      #         "ublock-quick-fixes"
      #         "easylist"
      #         "easyprivacy"
      #         "urlhaus-1"
      #         "plowe-0"
      #         "adguard-spyware-url"
      #         "fanboy-cookiemonster"
      #         "ublock-cookies-easylist"
      #         "easylist-annoyances"
      #         "easylist-chat"
      #         "easylist-newsletters"
      #         "easylist-notifications"
      #         "ublock-annoyances"
      #         "IDN-0"
      #       ];
      #     };
      #   };
      # };

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
    # thunderbird = {
    #   enable = true;

    #   profiles."default".isDefault = true;
    # };

    mpv.enable = true;
  };

  xdg.configFile = {
    "mpv".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/mpv";
  };
}
