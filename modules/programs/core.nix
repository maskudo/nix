{
  pkgs,
  username,
  ...
}:
{
  programs = {
    light.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  security.rtkit.enable = true;
  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  systemd = {
    enableEmergencyMode = false;
    extraConfig = "DefaultTimeoutStopSec=10s";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      ${username} = {
        isNormalUser = true;
        linger = true;
        description = "${username}";
        shell = pkgs.zsh;
        extraGroups = [
          "networkmanager"
          "wheel"
          "video"
          "audio"
          "vboxusers"
          "input"
          "uinput"
          "render"
        ];
      };
    };
    groups.video = {
      members = [ username ];
    };
  };

  # symlink bash to /bin/bash
  system.activationScripts.createBashSymlink = ''
    mkdir -p /bin
    ln -sf ${pkgs.bash}/bin/bash /bin/bash
  '';

  documentation = {
    enable = true;
    man.enable = true;
    dev.enable = true;
  };

  programs.nano.enable = false;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [
      "root"
      username
    ];
    trusted-substituters = [
      "https://devenv.cachix.org"
      "https://cache.saumon.network/proxmox-nixos"
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
    trusted-public-keys = [
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      "proxmox-nixos:nveXDuVVhFDRFx8Dn19f1WDEaNRJjPrF2CPD2D+m1ys="
    ];
  };
  nix.optimise.automatic = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/${username}/nix";
  };

  programs.command-not-found.enable = true;

  programs.zsh.enable = true;

  # for commands such as npm link to work
  programs.npm.enable = true;

  environment.systemPackages = with pkgs; [
    alsa-utils
    findutils
    gcc
    git
    glxinfo
    gnumake
    killall
    libcxx
    libgcc
    libnotify
    linux-manual
    lsof
    man-pages
    man-pages-posix
    nettools
    networkmanagerapplet
    nix-prefetch-git
    nmap
    plocate
    polkit
    powertop
    pulseaudioFull
    pavucontrol
    pciutils
    pkg-config
    psmisc
    unrar
    unzip
    usbutils
    wget
    xdotool
    xorg.xkill
    vim
    zip
    libsForQt5.qt5.qtquickcontrols
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
  environment.variables = {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
  };
}
