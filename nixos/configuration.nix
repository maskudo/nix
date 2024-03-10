{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  systemd.enableEmergencyMode = false;
  # Bootloader.
  boot.loader.grub = {
    enable = true;
    copyKernels = true;
    splashImage = ../wallpapers/nix-wallpaper-stripes-logo.png;
    efiInstallAsRemovable = true;
    efiSupport = true;
    useOSProber = true;
    fsIdentifier = "uuid";
    devices = ["nodev"];
  };
  boot.supportedFilesystems = ["ntfs"];
  boot.loader.grub.extraEntries = ''
    menuentry "Reboot" {
      reboot
    }
    menuentry "Poweroff" {
      halt
    }
  '';

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than +5";
  };

  networking = {
    hostName = "nixos"; # Define your hostname.
    wireless.enable = false; # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services.locate = {
    enable = true;
    package = pkgs.plocate;
    localuser = null;
  };

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEMS=="usb", SUBSYSTEM=="block", ENV{ID_FS_USAGE}=="filesystem", RUN{program}+="${pkgs.systemd}/bin/systemd-mount --no-block --automount=yes --collect $devnode /media"
  '';

  services.power-profiles-daemon.enable = true;

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true; # Thumbnail support for images

  services.syncthing.enable = true;
  # services.syncthing.user = "mk489";
  services.syncthing.openDefaultPorts = true;

  virtualisation.docker.enable = true;

  #configure keymap in X11
  nixpkgs.config = {
    packageOverrides = pkgs: rec {
      polybar = pkgs.polybar.override {
        i3Support = true;
        pulseSupport = true;
      };
    };
  };

  services.xserver = {
    enable = true;
    libinput = {
      enable = true;
      touchpad = {
        tapping = true;
        middleEmulation = true;
        naturalScrolling = true;
      };
      mouse = {
        naturalScrolling = false;
      };
    };
    layout = "us";
    xkbVariant = "";
    displayManager = {
      sddm.enable = true;
      sddm.theme = "${import ./sddm-theme.nix {inherit pkgs;}}";
      defaultSession = "none+i3";
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dunst
        rofi
        picom
        polybar
      ];
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  services.blueman.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.groups.video = {};
  users.users.mk489 = {
    isNormalUser = true;
    description = "mk489";
    shell = pkgs.bash;
    extraGroups = ["networkmanager" "wheel" "video" "audio" "docker"];
    packages = with pkgs; [
      firefox
      #  thunderbird
    ];
  };

  nixpkgs.config.allowUnfree = true;

  qt.enable = true;
  qt.platformTheme = "gtk2";
  qt.style = "breeze";

  environment.systemPackages = with pkgs; [
    feh
    findutils
    gcc
    git
    gnumake
    killall
    ldmtool
    libcxx
    libgcc
    libstdcxx5
    nettools
    nix-prefetch-git
    plocate
    pulseaudioFull
    python3
    unzip
    usbutils
    vim
    wget
    xdotool
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];
  };
  services.flatpak.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];
  programs.light.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;

  system.stateVersion = "23.05"; # Did you read the comment?
}
