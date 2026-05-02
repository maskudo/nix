{
  lib,
  config,
  pkgs,
  inputs,
  system,
  ...
}:
let
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
in
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

    home.packages =
      with pkgs;
      [
        # discord
        # (discord.override {
        #   withVencord = true;
        # })
        vesktop
        feh
        flameshot
        floorp-bin
        google-chrome
        kitty
        libresprite
        localsend
        nicotine-plus
        obsidian
        qbittorrent
        vscode
        inputs.zen-browser.packages."${system}".default
      ]
      ++ lib.optionals isDarwin [
        raycast
        iina
        postman
        nodemon
        # jankyborders
      ]
      ++ lib.optionals (!isDarwin) [
        adw-gtk3
        adwaita-icon-theme
        arandr
        arc-icon-theme
        arc-theme
        authenticator
        copyq
        cozy
        evince
        firefox
        kdePackages.breeze
        libreoffice
        lxappearance
        lxrandr
        mpv
        normcap
        nwg-look
        obs-studio
        pcmanfm
        pinta
        protonvpn-gui
        qogir-icon-theme
        qogir-theme
        rxvt-unicode
        smplayer
        xarchiver
        xclip
        xsel
        zathura
      ];

    programs.aerospace = {
      enable = isDarwin;
      launchd = {
        enable = isDarwin;
        keepAlive = isDarwin;
      };
    };
  };
}
