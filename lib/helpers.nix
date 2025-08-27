{
  inputs,
  ...
}:
{
  mkHome =
    {
      username,
      system ? "x86_64-linux",
      enableGuiApps ? true,
      unstablePkgs ? import inputs.unstable {
        system = system;
        config.allowUnfree = true;
      },
      stablePkgs ? inputs.nixpkgs.legacyPackages.${system},
      ...
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      modules = [
        (import ../home/home-manager.nix {
          homeDirectory = "/home/${username}";
          inherit username inputs stablePkgs;
        })
        inputs.catppuccin.homeModules.catppuccin
        inputs.nix-index-database.homeModules.nix-index
        (
          { ... }:
          {
            home.guiApps.enable = enableGuiApps;
            programs.nix-index-database.comma.enable = true;
          }
        )
      ];
      pkgs = unstablePkgs;
      extraSpecialArgs = {
        inherit
          username
          inputs
          system
          enableGuiApps
          stablePkgs
          ;
      };
    };

  mkHost =
    {
      username,
      system ? "x86_64-linux",
      unstablePkgs ? import inputs.unstable {
        system = system;
        config.allowUnfree = true;
      },
    }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit
          inputs
          system
          username
          unstablePkgs
          ;
      };
      modules = [
        ../hosts
        inputs.grub2-themes.nixosModules.default
        inputs.flake-programs-sqlite.nixosModules.programs-sqlite
      ];
    };
}
