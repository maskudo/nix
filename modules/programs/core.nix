{pkgs, ...}: {
  programs = {
    light.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
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
    lsof
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
}
