{ homeDirectory, username }:

{ pkgs, ... }:

{
  home.homeDirectory = homeDirectory;
  nixpkgs.config.allowUnfree = true;
  home.username = username;
  home.packages = with pkgs; [
    # TUI
    bat
    du-dust
    fd
    ffmpeg
    fzf
    glibcLocales
    haskellPackages.tldr
    jq
    jq 
    lazydocker
    lazygit 
    lf
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
    light
    mpv
    rxvt-unicode
    smplayer
    vlc
    vscode
    xfce.thunar

  ];
  home.stateVersion = "23.11";
  
}
