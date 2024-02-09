{
  homeDirectory,
  username,
}: {pkgs, ...}: {
  home.homeDirectory = homeDirectory;
  nixpkgs.config.allowUnfree = true;
  targets.genericLinux.enable = true;
  home.username = username;
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    # TUI
    (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono" "Iosevka"];})
    alejandra
    bat
    bc
    btop
    du-dust
    emacs
    fd
    feh
    ffmpeg
    findutils
    fzf
    go
    haskellPackages.tldr
    jq
    lazydocker
    lazygit
    lf
    neofetch
    neovim
    nettools
    nodejs_20
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
    w3m
    yq
    zoxide

    # GUI
    arandr
    betterlockscreen
    brave
    copyq
    discord
    flameshot
    gimp
    gnome.gnome-disk-utility
    gparted
    kitty
    mpv
    pulseaudioFull
    qbittorrent
    rxvt-unicode
    slack
    smplayer
    vlc
    vscode
    xdotool
    xfce.thunar
  ];
  home.stateVersion = "23.11";
}
