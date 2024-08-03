{
  description = "mk489's nix config'";

  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    username = "mk489";
    system = "x86_64-linux";
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    # sudo nixos-rebuild switch --flake .#aspire
    nixosConfigurations = {
      aspire = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs system username;};
        # > Our main nixos configuration file <
        modules = [./hosts/aspire];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    # home-manager -- build --flake .#x86_64-linux
    # home-manager -- switch --flake .#x86_64-linux

    homeConfigurations = let
      homeManagerModule = import ./home/home-manager.nix {
        homeDirectory = "/home/" + username;
        inherit username;
      };
      homeManager = system:
        home-manager.lib.homeManagerConfiguration {
          modules = [homeManagerModule];
          pkgs = nixpkgs.legacyPackages.${system};
        };
    in {
      aarch64-darwin = homeManager "aarch64-darwin";
      aarch64-linux = homeManager "aarch64-linux";
      x86_64-darwin = homeManager "x86_64-darwin";
      x86_64-linux = homeManager "x86_64-linux";
    };
  };
}
