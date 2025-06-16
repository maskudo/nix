{
  description = "mk489's nix config'";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "unstable";
    home-manager.url = "github:nix-community/home-manager";
    proxmox-nixos.url = "github:SaumonNet/proxmox-nixos";
    grub2-themes.url = "github:vinceliuice/grub2-themes";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    catppuccin.url = "github:catppuccin/nix";
    portainer-on-nixos.url = "gitlab:cbleslie/portainer-on-nixos";
    portainer-on-nixos.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs =
    {
      nixpkgs,
      home-manager,
      unstable,
      grub2-themes,
      ...
    }@inputs:
    let
      aspire = "mk489";
      omen = "omen";
      probook = "probook";
      system = "x86_64-linux";
      unstablePkgs = import unstable {
        system = system;
        config.allowUnfree = true;
      };
    in
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      # sudo nixos-rebuild switch --flake .#aspire
      nixosConfigurations = {
        aspire = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs system;
            username = aspire;
          };
          # > Our main nixos configuration file <
          modules = [
            ./hosts/aspire
            grub2-themes.nixosModules.default
          ];
        };
        probook = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs system unstablePkgs;
            username = probook;
          };
          modules = [
            ./hosts/probook
            grub2-themes.nixosModules.default
          ];
        };
        omen = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs system unstablePkgs;
            username = omen;
          };
          modules = [
            ./hosts/omen
            grub2-themes.nixosModules.default
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      # home-manager -- build --flake .aspire
      # home-manager -- switch --flake .aspire

      homeConfigurations =
        let
          homeManager =
            {
              system,
              username,
              enableGuiApps ? true,
            }:
            home-manager.lib.homeManagerConfiguration {
              modules = [
                (import ./home/home-manager.nix {
                  homeDirectory = "/home/${username}";
                  inherit username;
                })
                inputs.catppuccin.homeModules.catppuccin
                (
                  { ... }:
                  {
                    home.guiApps.enable = enableGuiApps;
                  }
                )
              ];
              pkgs = unstablePkgs;
              extraSpecialArgs = {
                stablePkgs = nixpkgs.legacyPackages.${system};
                inherit
                  username
                  inputs
                  system
                  enableGuiApps
                  ;
              };
            };
        in
        {
          aspire = homeManager {
            system = "x86_64-linux";
            username = aspire;
            enableGuiApps = false;
          };
          probook = homeManager {
            system = "x86_64-linux";
            username = probook;
            enableGuiApps = false;
          };
          omen = homeManager {
            system = "x86_64-linux";
            username = omen;
          };
        };
    };
}
