{ pkgs, ... }:
{
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
    act
    ansible
    atuin
    autorandr
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
    glow
    go
    evil-helix
    imagemagick
    jless
    jq
    jqp
    just
    k9s
    kubectl
    lazydocker
    lazygit
    lua5_1
    luarocks
    minikube
    neofetch
    nixd
    nixfmt-rfc-style
    nodejs_23
    nodePackages.live-server
    nodePackages.pnpm
    nixos-firewall-tool
    opentofu # terraform
    pandoc
    texlive.combined.scheme-small # for pdf
    poetry
    postgresql
    presenterm
    python3
    ripgrep
    rustup
    sqlite
    sshs
    stow
    starship
    tealdeer
    television
    tmux
    uv
    vim
    yazi
    yq
    yt-dlp
    zoxide
  ];

  programs.neovim = {
    enable = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = with pkgs; [
      imagemagick
      cowsay
      fortune
    ];
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
