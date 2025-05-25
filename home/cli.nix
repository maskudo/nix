{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # home.activation = {
  #   setLockScreen = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #     export PATH=${pkgs.xorg.xrdb}/bin:$PATH
  #     ${pkgs.betterlockscreen}/bin/betterlockscreen -u ~/Pictures/Wallpapers/
  #   '';
  # };

  home.packages = with pkgs; [
    act
    ansible
    awscli2
    atuin
    autorandr
    bat
    bc
    btop
    calcurse
    cowsay
    delta
    dig
    distrobox
    dua
    evil-helix
    fd
    ffmpeg
    font-awesome
    fortune
    fzf
    gh
    glow
    go
    imagemagick
    jless
    jq
    jqp
    just
    k9s
    kubectl
    kubernetes-helm
    lazydocker
    lazygit
    lua5_1
    luarocks
    minikube
    neofetch
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.zed-mono
    nixd
    nixfmt-rfc-style
    nixos-firewall-tool
    nodePackages.live-server
    nodePackages.pnpm
    nodejs_24
    nwg-look
    opentofu # terraform
    pandoc
    poetry
    postgresql
    presenterm
    python311
    ripgrep
    rustup
    sqlite
    sshs
    starship
    stow
    tealdeer
    television
    texlive.combined.scheme-small # for pdf
    tmux
    typst
    uv
    vim
    yazi
    yq
    yt-dlp
    zathura
    zoxide
  ];

  programs.neovim = {
    enable = true;
    extraLuaPackages = ps: [ ps.magick ];
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    silent = true;
  };
}
