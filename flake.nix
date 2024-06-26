{
  description = "mk489's nix config'";

  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = (
      import ./hosts {
        inherit inputs nixpkgs;
      }
    );

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = let
      homeManagerModule = import ./home/home-manager.nix {
        homeDirectory = /home/mk489;
        username = "mk489";
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
