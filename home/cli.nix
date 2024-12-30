{pkgs, ...}: {
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
    nerd-fonts.jetbrains-mono
    nerd-fonts.zed-mono
    nerd-fonts.fira-code
    alejandra
    ansible
    atuin
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
    ghostty
    glow
    go
    helix
    imagemagick
    jq
    k9s
    kubectl
    lazydocker
    lazygit
    neofetch
    neovim
    nixd
    nodejs_20
    nodePackages.pnpm
    nixos-firewall-tool
    opentofu # terraform
    pandoc
    texlive.combined.scheme-small # for pdf
    poetry
    postgresql
    python3
    ripgrep
    rustup
    sqlite
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
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
