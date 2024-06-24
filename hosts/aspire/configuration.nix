{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    virtualbox.host.enableExtensionPack = true;
    packageOverrides = pkgs: {
      polybar = pkgs.polybar.override {
        i3Support = true;
        pulseSupport = true;
      };
    };
  };

  # Bootloader.
  boot = {
    kernelModules = ["kvm-amd" "kvm-intel"];
    loader.grub = {
      enable = true;
      copyKernels = true;
      splashImage = ../../wallpapers/nix-wallpaper-stripes-logo.png;
      efiInstallAsRemovable = true;
      efiSupport = true;
      useOSProber = true;
      fsIdentifier = "uuid";
      devices = ["nodev"];
    };
    kernelParams = ["button.lid_init_state=open"];
    supportedFilesystems = ["ntfs"];
    loader.grub.extraEntries = ''
      menuentry "Reboot" {
        reboot
      }
      menuentry "Poweroff" {
        halt
      }
    '';
  };

  services = {
    dbus.packages = [pkgs.dconf];
    resolved.enable = true;
    logind = {
      lidSwitch = "ignore";
      extraConfig = ''
        HandlePowerKey=ignore
      '';
    };

    locate = {
      enable = true;
      package = pkgs.plocate;
      localuser = null;
    };

    flatpak.enable = true;
    openssh.enable = true;

    postgresql.enable = true;

    udev.extraRules = ''
      ACTION=="add", SUBSYSTEMS=="usb", SUBSYSTEM=="block", ENV{ID_FS_USAGE}=="filesystem", RUN{program}+="${pkgs.systemd}/bin/systemd-mount --no-block --automount=yes --collect $devnode /media"
    '';
    power-profiles-daemon.enable = true;
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    tumbler.enable = true; # Thumbnail support for images

    syncthing.enable = true;
    syncthing.openDefaultPorts = true;
    # syncthing.user = "mk489";
    tailscale.enable = true;

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
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
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
    displayManager = {
      sddm.enable = true;
      sddm.theme = "${import ../../modules/sddm-theme.nix {inherit pkgs;}}";
      defaultSession = "none+i3";
    };

    # Enable CUPS to print documents.
    printing.enable = true;

    blueman.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  security.rtkit.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than +5";
  };

  networking = {
    hostName = "mk489-nixos"; # Define your hostname.
    wireless.enable = false; # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
    nameservers = ["1.1.1.1" "9.9.9.9"];
  };

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
    virtualbox = {
      host.enable = true;
      guest.enable = true;
      # guest.x11 = true;
      host.enableHardening = false;
    };
  };
  users.extraGroups.vboxusers.members = ["kv"];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  systemd = {
    enableEmergencyMode = false;
    services.syncthing.serviceConfig.UMask = "0007";
    tmpfiles.rules = [
      "d /home/mk489 0750 mk489 syncthing"
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      mk489 = {
        isNormalUser = true;
        description = "mk489";
        shell = pkgs.bash;
        extraGroups = ["networkmanager" "wheel" "video" "audio" "docker" "syncthing" "vboxusers"];
        packages = [
        ];
      };
      syncthing.extraGroups = ["users"];
    };
    groups.video = {};
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    findutils
    gcc
    git
    gnumake
    killall
    libcxx
    libgcc
    libstdcxx5
    nettools
    networkmanagerapplet
    nix-prefetch-git
    nmap
    plocate
    polkit
    pulseaudioFull
    pavucontrol
    tailscale
    unzip
    usbutils
    wget
    xdotool
    vim
    libsForQt5.qt5.qtquickcontrols
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

  qt = {
    enable = true;
    platformTheme = "gtk2";
    style = "breeze";
  };

  programs = {
    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [
      alsa-lib
      at-spi2-atk
      at-spi2-core
      atk
      cairo
      cups
      curl
      dbus
      expat
      fontconfig
      freetype
      fuse3
      gdk-pixbuf
      glib
      gtk3
      icu
      libGL
      libappindicator-gtk3
      libdrm
      libglvnd
      libnotify
      libpulseaudio
      libunwind
      libusb1
      libuuid
      libxkbcommon
      libxml2
      mesa
      nspr
      nss
      openssl
      pango
      pipewire
      stdenv.cc.cc
      systemd
      vulkan-loader
      xorg.libX11
      xorg.libXScrnSaver
      xorg.libXcomposite
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libXrandr
      xorg.libXrender
      xorg.libXtst
      xorg.libxcb
      xorg.libxkbfile
      xorg.libxshmfence
      zlib
    ];

    light.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  system.stateVersion = "23.05"; # Did you read the comment?
}
