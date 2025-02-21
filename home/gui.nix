{ pkgs, ... }:
{
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  nixpkgs.config = {
    packagesOverrides = pkgs: {
      firefox = pkgs.firefox.override {
        enableVaapi = true;
      };
    };
  };

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
    deadbeef-with-plugins
    dracula-theme
    kanagawa-gtk-theme
    kanagawa-icon-theme
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
    normcap
    obs-studio
    obsidian
    pinta
    qbittorrent
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
