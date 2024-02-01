{ homeDirectory, username }:

{ pkgs, ... }:

{
  home.homeDirectory = homeDirectory;
  nixpkgs.config.allowUnfree = true;
  targets.genericLinux.enable = true;
  home.username = username;
  home.packages = with pkgs; [
    # TUI
    bat
    du-dust
    fd
    ffmpeg
    fzf
    haskellPackages.tldr
    jq
    lazydocker
    lazygit
    lf
    light
    neovim
    nettools
    pandoc
    rclone
    rclone-browser
    ripgrep
    tmux
    vim
    zoxide

    # GUI
    arandr
    copyq
    flameshot
    gimp
    gnome.gnome-disk-utility
    kitty
    mpv
    rxvt-unicode
    smplayer
    vlc
    vscode
    xfce.thunar

  ];
  home.stateVersion = "23.11";
  
}
