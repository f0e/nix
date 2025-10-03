{...}: {
  # touchid sudo prompts rather than entering password
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    startup.chime = false;

    defaults = {
      NSGlobalDomain = {
        AppleShowAllFiles = true;

        # enable cycling through ui buttons with tab
        AppleKeyboardUIMode = 3;

        # disable keyboard shit
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.15;

        mru-spaces = false;
        show-recents = false;
        showhidden = true;
      };
      finder = {
        AppleShowAllExtensions = true;
        ShowPathbar = true;
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
      };
      controlcenter = {
        BatteryShowPercentage = true;
      };
      CustomSystemPreferences = {
        # NSGlobalDomain = {
        #   AppleAccentColor = 6;
        # };
        "com.apple.desktopservices" = {
          # dont create .DS_Store files on USB or network volumes
          DSDontWriteUSBStores = true;
          DSDontWriteNetworkStores = true;
        };
        "com.apple.AdLib" = {
          # disable personalized advertising
          forceLimitAdTracking = true;
          allowApplePersonalizedAdvertising = false;
          allowIdentifierForAdvertising = false;
        };
      };
    };
  };

  system.activationScripts.setting.text = ''
    # change default apps

    # video player
    duti -s com.colliderli.iina .mp4 all
    duti -s com.colliderli.iina .mkv all
    duti -s com.colliderli.iina .mov all
    duti -s com.colliderli.iina .avi all
    duti -s com.colliderli.iina .flv all
    duti -s com.colliderli.iina .wmv all
    duti -s com.colliderli.iina .webm all
    duti -s com.colliderli.iina .m4v all
    duti -s com.colliderli.iina .mpeg all
    duti -s com.colliderli.iina .mpg all
    duti -s com.colliderli.iina .vob all
    duti -s com.colliderli.iina .ts all
    duti -s com.colliderli.iina .m2ts all
    duti -s com.colliderli.iina .ogv all
    duti -s com.colliderli.iina .rm all
    duti -s com.colliderli.iina .rmvb all
    duti -s com.colliderli.iina .3gp all
    duti -s com.colliderli.iina .f4v all
    duti -s com.colliderli.iina .asf all
  '';
}
