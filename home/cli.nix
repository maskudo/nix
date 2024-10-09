{
  pkgs,
  lib,
  ...
}: {
  fonts.fontconfig.enable = true;
  dconf.enable = true;

  # home.activation = {
  #   setLockScreen = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #     export PATH=${pkgs.xorg.xrdb}/bin:$PATH
  #     ${pkgs.betterlockscreen}/bin/betterlockscreen -u ~/Pictures/Wallpapers/
  #   '';
  # };

  home.packages = with pkgs; [
    font-awesome
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    alejandra
    bat
    btop
    calcurse
    dconf
    delta
    dig
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
    neofetch
    neovim
    nixd
    nodejs_20
    nodePackages.pnpm
    pandoc
    poetry
    python3
    python311Packages.pip
    ripgrep
    rustup
    sshs
    stow
    starship
    tealdeer
    tmux
    uv
    vim
    yazi
    yq
    yt-dlp
    zoxide
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
