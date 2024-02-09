{ homeDirectory, username }:

{ pkgs, ... }:

{
  home.homeDirectory = homeDirectory;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config = {
  packageOverrides = pkgs: rec {
    polybar = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
      };
    };
  };
  targets.genericLinux.enable = true;
  home.username = username;
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    # TUI
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "Iosevka"]; })
    bat
    bc
    brave
    btop
    du-dust
    emacs
    fd
    feh
    ffmpeg
    findutils
    fzf
    haskellPackages.tldr
    jq
    lazydocker
    lazygit
    lf
    neofetch
    neovim
    nettools
    pandoc
    plocate
    rclone
    rclone-browser
    ripgrep
    rustup
    stow
    starship
    tmux
    tokei
    vim
    w3m
    yq
    zoxide

    # GUI
    arandr
    betterlockscreen
    copyq
    discord
    dunst
    flameshot
    gimp
    gnome.gnome-disk-utility
    gparted
    kitty
    mpv
    picom
    polybar
    pulseaudioFull
    qbittorrent
    rxvt-unicode
    rofi
    slack
    smplayer
    vlc
    vscode
    xdotool
    xfce.thunar
    
  ];
  home.stateVersion = "23.11";
  
}
