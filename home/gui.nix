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
      google-chrome
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
      pcmanfm
      pinta
      qbittorrent
      rose-pine-gtk-theme
      rose-pine-icon-theme
      rxvt-unicode
      smplayer
      vlc
      vscode
      xarchiver
      xclip
      xsel
      inputs.zen-browser.packages."${system}".default

    ];
  };
}
