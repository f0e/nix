{
  config,
  pkgs,
  inputs,
  ...
}: {
  # needed so nixos time is compatible with Windows time
  time.hardwareClockInLocalTime = true;
  environment.shellAliases = {
    "@win" = "bootctl set-oneshot auto-windows; echo 'on next reboot only: Windows will boot by default'";
    "@win-now" = "systemctl reboot --boot-loader-entry=auto-windows; echo 'now rebooting into windows'";
  };

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.efi.efiSysMountPoint = "/efi";
  boot.loader.systemd-boot.xbootldrMountPoint = "/boot";

  # Use latest kernel for best hardware support
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Brisbane";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # https://nixos.wiki/wiki/Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.displayManager.defaultSession = "hyprland";

  # Configure keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true; # Enabled for better audio production support
  };

  programs.zsh.enable = true;

  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};

    users = {
      "admin" = import ./users/admin.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System version
  system.stateVersion = "25.05";

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  services.xserver = {
    videoDrivers = ["nvidia"];
  };

  services.libinput = {
    # disable mouse acceleration
    mouse = {
      accelProfile = "flat";
    };
  };

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # use open-source drivers (recommended)
    open = true;

    # Enable the Nvidia settings menu
    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      # latest doesnt work
      version = "580.65.06";
      sha256_64bit = "sha256-BLEIZ69YXnZc+/3POe1fS9ESN1vrqwFy6qGHxqpQJP8=";
      openSha256 = "sha256-BKe6LQ1ZSrHUOSoV6UCksUE0+TIa0WcCHZv4lagfIgA=";
      settingsSha256 = "sha256-9PWmj9qG/Ms8Ol5vLQD3Dlhuw4iaFtVHNC0hSyMCU24=";
      usePersistenced = false;
    };
  };

  # Enable hardware video acceleration
  hardware.graphics.extraPackages = with pkgs; [
    nvidia-vaapi-driver
    vaapiVdpau
    libvdpau-va-gl
  ];

  boot.supportedFilesystems = [
    "ntfs"
    "fuse.sshfs"
  ];

  # mount storage partition
  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/F4DE2A65DE2A1FFA";
    fsType = "ntfs-3g";
    options = ["rw" "uid=1000" "gid=100" "umask=0022"];
  };

  # mount windows partition
  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/20A60232A60208CC";
    fsType = "ntfs-3g";
    options = ["r" "uid=1000" "gid=100" "umask=0022"];
  };

  fileSystems."/mnt/nas/documents" = {
    device = "root@192.168.4.67:/mnt/user/documents";
    fsType = "fuse.sshfs";
    options = [
      "allow_other" # for non-root access
      "_netdev" # this is a network fs
      "x-systemd.automount" # mount on demand

      "IdentityFile=/root/.ssh/id_ed25519"
    ];
  };

  services.tailscale.enable = true;
}
