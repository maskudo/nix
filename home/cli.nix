{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    act
    ansible
    awscli2
    atuin
    autorandr
    bat
    btop
    calcurse
    comma
    cowsay
    delta
    distrobox
    dua
    fd
    ffmpeg
    font-awesome
    fortune
    fzf
    gh
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
    minikube
    nerd-fonts.jetbrains-mono
    nixd
    nixfmt-rfc-style
    nixos-firewall-tool
    nodePackages.live-server
    nodePackages.pnpm
    nodejs_24
    nwg-look
    opentofu # terraform
    pandoc
    postgresql
    presenterm
    python311
    ripgrep
    rmpc
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
