{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    ansible
    awscli2
    atuin
    autorandr
    bat
    btop
    calcurse
    cowsay
    delta
    distrobox
    dragon-drop
    dua
    fd
    ffmpeg
    font-awesome
    carlito # calibri and ms fonts
    fortune
    fzf
    go
    git-lfs
    evil-helix
    imagemagick
    jq
    just
    k9s
    kubectl
    (wrapHelm kubernetes-helm {
      plugins = with pkgs.kubernetes-helmPlugins; [
        helm-secrets
        helm-diff
        helm-s3
        helm-git
      ];
    })
    helmfile
    lazydocker
    lazygit
    minikube
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    nixos-firewall-tool
    opentofu # terraform
    pandoc
    parallel
    pgadmin4
    postgresql
    presenterm
    ripgrep
    rmpc
    sqlite
    sshs
    starship
    stow
    systemctl-tui
    tealdeer
    television
    texlive.combined.scheme-small # for pdf
    tmux
    vim
    yazi
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
