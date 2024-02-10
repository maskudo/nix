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
    font-awesome
    (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono" "Iosevka"];})
    alejandra
    bat
    bc
    btop
    du-dust
    emacs
    fd
    ffmpeg
    fzf
    go
    haskellPackages.tldr
    jq
    lazydocker
    lazygit
    lf
    neofetch
    neovim
    nodejs_20
    pandoc
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
    arc-theme
    arc-icon-theme
    betterlockscreen
    brave
    catppuccin
    copyq
    discord
    flameshot
    gimp
    gnome.gnome-disk-utility
    gparted
    kitty
    lxappearance
    mpv
    qbittorrent
    qogir-theme
    qogir-icon-theme
    rxvt-unicode
    slack
    smplayer
    vlc
    vscode
    xfce.thunar
  ];
  home.stateVersion = "23.11";
}
