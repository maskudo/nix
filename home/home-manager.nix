{
  homeDirectory,
  username,
}: {pkgs, ...}: {
  imports = [../overlays/postmanOverlay.nix];
  home.homeDirectory = homeDirectory;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  targets.genericLinux.enable = true;
  home.username = username;
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    # TUI
    font-awesome
    (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono" "Iosevka"];})
    alejandra
    azure-cli
    bat
    bc
    btop
    du-dust
    emacs
    fd
    ffmpeg
    fzf
    gh
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
    poetry
    python311Packages.pip
    rclone
    rclone-browser
    ripgrep
    rustup
    stow
    starship
    terraform
    tmux
    tokei
    w3m
    yarn
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
    dracula-theme
    flameshot
    gimp
    gnome.gnome-disk-utility
    gparted
    kitty
    libsForQt5.breeze-qt5
    lxappearance
    mpv
    obsidian
    postman
    qbittorrent
    qogir-theme
    qogir-icon-theme
    rxvt-unicode
    slack
    smplayer
    virtualbox
    vlc
    vscode
    xarchiver
    xfce.xfconf
    xfce.thunar
  ];
  home.stateVersion = "23.11";
}
