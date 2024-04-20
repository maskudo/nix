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
  home.packages = with pkgs; [
    # TUI
    font-awesome
    (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono" "Iosevka"];})
    alejandra
    ansible
    azure-cli
    bat
    btop
    direnv
    emacs
    fd
    ffmpeg
    fzf
    gh
    git-extras
    git-lfs
    go
    haskellPackages.tldr
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
    terraform
    tmux
    yarn
    yq
    zoxide

    # GUI
    arandr
    arc-theme
    arc-icon-theme
    aseprite
    betterlockscreen
    brave
    catppuccin
    copyq
    dbeaver
    discord
    dracula-theme
    flameshot
    gimp
    gnome.gnome-disk-utility
    google-chrome
    gparted
    kitty
    libsForQt5.breeze-qt5
    lxappearance
    mpv
    nicotine-plus
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
