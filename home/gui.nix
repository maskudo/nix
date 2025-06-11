{
  lib,
  config,
  pkgs,
  inputs,
  system,
  ...
}:
{
  options = {
    home.guiApps.enable = lib.mkOption {
      description = "Enables GUI Apps";
      default = true;
      type = lib.types.bool;
    };
  };
  config = lib.mkIf config.home.guiApps.enable {
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
      authenticator
      betterlockscreen
      brave
      catppuccin
      copyq
      cozy
      dex
      discord
      # (discord.override {
      #   withVencord = true;
      # })
      deadbeef-with-plugins
      dracula-theme
      emacs
      evince
      feh
      (flameshot.override { enableWlrSupport = true; })
      floorp
      # firefox
      gparted
      google-chrome
      kanagawa-gtk-theme
      kanagawa-icon-theme
      kitty
      kdePackages.kmag
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
      qbittorrent-nox
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
  };
}
