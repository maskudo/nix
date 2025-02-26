{ ... }:
{
  imports = [
    ./tailscale.nix
    ./flatpak.nix
    ./proxmox.nix
    ./kde-connect.nix
    ./nfs-client.nix
    ./nfs-server.nix
    ./gnome-keyring.nix
  ];
}
