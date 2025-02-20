{
  description = "mk489's nix config'";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "unstable";
    home-manager.url = "github:nix-community/home-manager";
    proxmox-nixos.url = "github:SaumonNet/proxmox-nixos";
    grub2-themes.url = "github:vinceliuice/grub2-themes";
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
      system = "x86_64-linux";
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
            (
              { ... }:
              {
                services.proxmox.enable = true;
                environment.variables = {
                  MONITOR1 = "eDP1";
                  MONITOR2 = "HDMI1";
                };
              }
            )
          ];
        };
        omen = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs system;
            username = omen;
          };
          modules = [
            ./hosts/omen
            grub2-themes.nixosModules.default
            (
              { ... }:
              {
                environment.variables = {
                  MONITOR1 = "eDP";
                  MONITOR2 = "HDMI-1-0";
                };
              }
            )
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      # home-manager -- build --flake .aspire
      # home-manager -- switch --flake .aspire

      homeConfigurations =
        let
          homeManagerModule =
            username:
            import ./home/home-manager.nix {
              homeDirectory = "/home/" + username;
              inherit username;
            };
          homeManager =
            {
              system,
              username,
            }:
            home-manager.lib.homeManagerConfiguration {
              modules = [ (homeManagerModule username) ];
              pkgs = unstable.legacyPackages.${system};
              extraSpecialArgs = {
                inherit username inputs;
              };
            };
        in
        {
          aspire = homeManager {
            system = "x86_64-linux";
            username = aspire;
          };
          omen = homeManager {
            system = "x86_64-linux";
            username = omen;
          };
        };
    };
}
