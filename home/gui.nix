{pkgs, ...}: {
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  services.copyq.enable = true;

  home.packages = with pkgs; [
    arandr
    arc-theme
    arc-icon-theme
    betterlockscreen
    brave
    catppuccin
    copyq
    cozy
    dex
    discord
    dracula-theme
    emacs
    feh
    flameshot
    firefox
    gnome.gnome-disk-utility
    google-chrome
    gparted
    kitty
    libsForQt5.breeze-qt5
    libresprite
    lxappearance
    monitor
    mpv
    nicotine-plus
    obsidian
    pgadmin4
    pinta
    # postman
    qbittorrent
    qogir-theme
    qogir-icon-theme
    rxvt-unicode
    smplayer
    uget
    virtualbox
    vlc
    vscode
    xarchiver
    xfce.xfconf
    xfce.thunar
    xpad
  ];
}
