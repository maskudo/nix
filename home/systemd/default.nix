{ ... }:
{
  imports = [
    ./commit-zt.nix
    ./kanata.nix
    ./qbittorrent.nix
    ./syncPhotos.nix
  ];

  systemd.user.enable = true;
}
