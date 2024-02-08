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
    btop
    du-dust
    fd
    feh
    ffmpeg
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
    rclone
    rclone-browser
    ripgrep
    stow
    starship
    tmux
    vim
    zoxide

    # GUI
    arandr
    copyq
    dunst
    flameshot
    gimp
    gnome.gnome-disk-utility
    kitty
    mpv
    picom
    polybar
    pulseaudioFull
    rxvt-unicode
    rofi
    rustup
    smplayer
    vlc
    vscode
    xfce.thunar
    
  ];
  home.stateVersion = "23.11";
  
}
