{pkgs, ...}: {
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  services.emacs.enable = true;

  home.packages = with pkgs; [
    arandr
    arc-theme
    arc-icon-theme
    betterlockscreen
    brave
    catppuccin
    copyq
    dex
    discord
    deadbeef-with-plugins
    dracula-theme
    kanagawa-gtk-theme
    kanagawa-icon-theme
    emacs
    feh
    flameshot
    firefox
    gparted
    kitty
    libsForQt5.breeze-qt5
    libresprite
    lxappearance
    mpv
    nicotine-plus
    obsidian
    pinta
    qbittorrent
    quickemu
    qogir-theme
    qogir-icon-theme
    rxvt-unicode
    smplayer
    uget
    vlc
    vscode
    xarchiver
    xclip
    xfce.xfconf
    xfce.thunar
    xsel
  ];
}
