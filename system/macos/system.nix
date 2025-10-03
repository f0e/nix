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
    duti -s com.colliderli.iina .mp4 all
    duti -s com.colliderli.iina .mkv all
  '';
}
