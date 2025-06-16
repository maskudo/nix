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
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      modules = [
        (import ../home/home-manager.nix {
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
        stablePkgs = inputs.nixpkgs.legacyPackages.${system};
        inherit
          username
          inputs
          system
          enableGuiApps
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
      ];
    };
}
