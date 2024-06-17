{
  homeDirectory,
  username,
}: {pkgs, ...}: {
  imports = [../overlays/postmanOverlay.nix];
  home.homeDirectory = homeDirectory;
  nixpkgs.config.allowUnfree = true;
  targets.genericLinux.enable = true;
  home.username = username;
  fonts.fontconfig.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
  dconf.enable = true;
  home.packages = with pkgs; [
    # TUI
    font-awesome
    (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono" "Iosevka"];})
    alejandra
    azure-cli
    bat
    btop
    cmatrix
    dconf
    delta
    distrobox
    dua
    fd
    ffmpeg
    fzf
    gh
    git-extras
    git-lfs
    go
    imagemagick
    jq
    lazydocker
    lazygit
    lf
    neofetch
    neovim
    nodejs_20
    nodePackages.pnpm
    pandoc
    poetry
    python3
    python311Packages.pip
    ripgrep
    rustup
    stow
    starship
    tealdeer
    tmux
    vim
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
    emacs
    feh
    flameshot
    firefox
    gimp
    gnome.gnome-disk-utility
    google-chrome
    gparted
    kitty
    libsForQt5.breeze-qt5
    lxappearance
    monitor
    mpv
    nicotine-plus
    obsidian
    postman
    qbittorrent
    qogir-theme
    qogir-icon-theme
    rxvt-unicode
    smplayer
    virtualbox
    vlc
    vscode
    xarchiver
    xfce.xfconf
    xfce.thunar
  ];
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
  home.stateVersion = "23.11";
}
