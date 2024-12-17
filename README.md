# dotfiles.nix

## Usage:

Rebuild and switch home manager:

```bash
make
```

Rebuild and Switch System

```bash
sudo make nixos
```

> [!NOTE]
> Installing from the installer and rebuilding from the repo means systemd-boot may remain and load before grub.
> Make sure to `rm -rf /boot` and rebuild the system to make sure grub is the one loaded.

## Removing Old Generation

Go to /nix/var/nix/profiles/ and remove symlinks for generations you want to delete, then nix store gc.
