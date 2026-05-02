{ pkgs, ... }:
let
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
in
{
  fonts.fontconfig.enable = true;

  home.packages =
    with pkgs;
    [
      andcli
      ansible
      atuin
      awscli2
      bat
      biome
      btop
      calcurse
      carlito # calibri and ms fonts
      cowsay
      delta
      dig
      dua
      eslint
      evil-helix
      fd
      ffmpeg
      font-awesome
      fortune
      fzf
      git
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
      nodejs
      neovim
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
      nixd
      nixfmt
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
      tealdeer
      television
      texlive.combined.scheme-small # for pdf
      timer
      tmux
      tree-sitter
      typescript-language-server
      uv
      vim
      yazi
      zoxide
    ]
    ++ lib.optionals (!isDarwin) [
      autorandr
      distrobox
      minikube
      nixos-firewall-tool
      systemctl-tui
      yt-dlp
    ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    silent = true;
  };
}
