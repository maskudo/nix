{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    andcli
    ansible
    atuin
    autorandr
    awscli2
    bat
    biome
    btop
    calcurse
    carlito # calibri and ms fonts
    cowsay
    delta
    dig
    distrobox
    dua
    eslint
    evil-helix
    fd
    ffmpeg
    font-awesome
    fortune
    fzf
    gh
    gh-dash
    git-lfs
    go
    helmfile
    (wrapHelm kubernetes-helm {
      plugins = with pkgs.kubernetes-helmPlugins; [
        helm-secrets
        helm-diff
        helm-s3
        helm-git
      ];
    })
    imagemagick
    jq
    just
    k9s
    kubectl
    kubectl-cnpg
    lazydocker
    lazygit
    lua5_1
    minikube
    neovim
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nixd
    nixfmt
    nixos-firewall-tool
    nodePackages.pnpm
    opentofu # terraform
    pandoc
    parallel
    pgadmin4
    postgresql
    presenterm
    prettier
    python311
    ripdrag
    ripgrep
    rmpc
    rustup
    sqlite
    sshs
    starship
    stow
    systemctl-tui
    tealdeer
    television
    texlive.combined.scheme-small # for pdf
    timer
    tmux
    typescript-language-server
    uv
    vim
    yazi
    zoxide
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    silent = true;
  };
}
