{pkgs, ...}: {
  programs = {
    light.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
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

  environment.systemPackages = with pkgs; [
    alsa-utils
    docker-compose
    findutils
    gcc
    git
    gnumake
    killall
    libcxx
    libgcc
    libnotify
    libstdcxx5
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
    psmisc
    unrar
    unzip
    usbutils
    wget
    xdotool
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
