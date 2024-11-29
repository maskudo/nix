{
  description = "mk489's nix config'";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "unstable";
    home-manager.url = "github:nix-community/home-manager";
    proxmox-nixos.url = "github:SaumonNet/proxmox-nixos";
  };

  outputs = {
    nixpkgs,
    home-manager,
    unstable,
    ...
  } @ inputs: let
    aspire = "mk489";
    omen = "omen";
    system = "x86_64-linux";
  in {
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
          ({...}: {
            services.proxmox.enable = true;
          })
        ];
      };
      omen = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs system;
          username = omen;
        };
        modules = [./hosts/omen];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    # home-manager -- build --flake .aspire
    # home-manager -- switch --flake .aspire

    homeConfigurations = let
      homeManagerModule = username:
        import ./home/home-manager.nix {
          homeDirectory = "/home/" + username;
          inherit username;
        };
      homeManager = {
        system,
        username,
      }:
        home-manager.lib.homeManagerConfiguration {
          modules = [(homeManagerModule username)];
          pkgs = unstable.legacyPackages.${system};
          extraSpecialArgs = {
            inherit username;
          };
        };
    in {
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
