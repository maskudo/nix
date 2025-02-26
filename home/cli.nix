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
    atuin
    autorandr
    bat
    btop
    calcurse
    cowsay
    dconf
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
    git-extras
    git-lfs
    glow
    go
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
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.zed-mono
    nixd
    nixfmt-rfc-style
    nixos-firewall-tool
    nodePackages.live-server
    nodePackages.pnpm
    nodejs_23
    nwg-look
    opentofu # terraform
    pandoc
    poetry
    postgresql
    presenterm
    python3
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
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
