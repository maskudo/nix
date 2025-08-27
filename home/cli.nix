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
    evil-helix
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
    minikube
    mpc
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    nixos-firewall-tool
    nwg-look
    opentofu # terraform
    pandoc
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
    typst
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
