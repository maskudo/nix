{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  dconf.enable = true;

  home.packages = with pkgs; [
    font-awesome
    (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono" "Iosevka"];})
    alejandra
    azure-cli
    bat
    btop
    calcurse
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
    mpd
    neofetch
    neovim
    nixd
    nix-tree
    nodejs_20
    nodePackages.pnpm
    pandoc
    poetry
    python3
    python311Packages.pip
    ripgrep
    rustup
    slides
    sshs
    stow
    starship
    tealdeer
    tmux
    vim
    yarn
    yazi
    yq
    zoxide
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
