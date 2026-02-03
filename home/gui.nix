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

    home.packages = with pkgs; [
      adw-gtk3
      adwaita-icon-theme
      arandr
      arc-theme
      arc-icon-theme
      authenticator
      copyq
      cozy
      # discord
      # (discord.override {
      #   withVencord = true;
      # })
      vesktop
      evince
      feh
      (flameshot.override { enableWlrSupport = true; })
      floorp-bin
      # firefox
      google-chrome
      kitty
      kdePackages.breeze
      libreoffice
      libresprite
      localsend
      lxappearance
      lxrandr
      mpv
      nicotine-plus
      normcap
      nwg-look
      obs-studio
      obsidian
      pcmanfm
      pinta
      protonvpn-gui
      qbittorrent
      qogir-theme
      qogir-icon-theme
      rxvt-unicode
      smplayer
      vscode
      xarchiver
      xclip
      xsel
      zathura
      inputs.zen-browser.packages."${system}".default
    ];
  };
}
