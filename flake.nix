{
  description = "mk489's nix config'";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "unstable";
    home-manager.url = "github:nix-community/home-manager";
    proxmox-nixos.url = "github:SaumonNet/proxmox-nixos";
    grub2-themes.url = "github:vinceliuice/grub2-themes";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    portainer-on-nixos.url = "gitlab:cbleslie/portainer-on-nixos";
    portainer-on-nixos.inputs.nixpkgs.follows = "nixpkgs";
    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    flake-programs-sqlite.inputs.nixpkgs.follows = "unstable";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "unstable";
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      aspire = "mk489";
      omen = "omen";
      libx = import ./lib {
        inherit
          inputs
          ;
      };
    in
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      # sudo nixos-rebuild switch --flake .#aspire
      nixosConfigurations = {
        aspire = libx.mkHost {
          username = aspire;
          enableGuiApps = false;
        };
        omen = libx.mkHost {
          username = omen;
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      # home-manager -- build --flake .aspire
      # home-manager -- switch --flake .aspire

      homeConfigurations = {
        aspire = libx.mkHome {
          system = "x86_64-linux";
          username = aspire;
          enableGuiApps = false;
          mods = [
            (
              { ... }:
              {
                services.sync-photos.enable = true;
              }
            )
          ];
        };
        omen = libx.mkHome {
          system = "x86_64-linux";
          username = omen;
        };
      };

      templates = {
        simple = {
          description = "Minimal flake with only a devshell";
          path = ./templates/simple;
        };
      };
      defaultTemplate = inputs.self.templates.simple;
    };
}
