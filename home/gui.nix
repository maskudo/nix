{
  pkgs,
  inputs,
  system,
  ...
}:
{
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  catppuccin.flavor = "mocha";
  catppuccin.gtk.enable = true;
  catppuccin.hyprland.enable = true;

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
    (discord.override {
      withVencord = true;
    })
    deadbeef-with-plugins
    dracula-theme
    kanagawa-gtk-theme
    kanagawa-icon-theme
    feh
    (flameshot.override { enableWlrSupport = true; })
    # firefox
    gparted
    kitty
    libsForQt5.breeze-qt5
    libresprite
    lxappearance
    lxrandr
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
    inputs.zen-browser.packages."${system}".default

  ];
}
