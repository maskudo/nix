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

  environment.systemPackages = with pkgs; [
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
    pulseaudioFull
    pavucontrol
    pciutils
    psmisc
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
  powerManagement.powertop.enable = true;
}
