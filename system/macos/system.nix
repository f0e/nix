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

        # sound when changing volume
        "com.apple.sound.beep.feedback" = 1;
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
    		_FXSortFoldersFirst = true;
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

  # todo: is this the best place to be doing this?
  system.activationScripts.extraActivation.text = ''
    # install rosetta
    if ! pkgutil --pkgs | grep -q "com.apple.pkg.RosettaUpdateAuto"; then
      softwareupdate --install-rosetta --agree-to-license
    fi

    # disable 'slightly dim the display on battery'
    sudo pmset -b lessbright 0
  '';
}
